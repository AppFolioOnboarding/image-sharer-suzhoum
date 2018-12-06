require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_new
    get new_image_path

    assert_response :ok
    assert_select 'h1', text: 'New Image'
    assert_select '#error_explanation', count: 0
  end

  def test_create__success
    assert_difference 'Image.count', 1 do
      post images_path, params: { image: { image_url: 'https://foo.png' } }
    end

    assert_redirected_to image_path(Image.find_by(image_url: 'https://foo.png'))
    follow_redirect!
    assert_select 'img' do
      assert_select '[src=?]', 'https://foo.png'
    end
  end

  def test_create__fail
    assert_no_difference 'Image.count' do
      post images_path, params: { image: { image_url: 'https://foo.invalid' } }
    end

    assert_response :ok
    assert_select 'h1', text: 'New Image'
    assert_select '#error_explanation', count: 1
  end

  def test_create_with_tag
    assert_difference 'Image.count', 1 do
      post images_path, params: { image: { image_url: 'http://foo.png', tag_list: 'test1' } }
    end
    assert_redirected_to image_path(Image.find_by(image_url: 'http://foo.png'))
    follow_redirect!
    assert_select 'p', text: 'Tags: test1'
  end

  def test_show
    image = Image.create(image_url: 'http://foo.png')
    get image_path(image)

    assert_response :ok
    assert_select 'img' do
      assert_select '[src=?]', 'http://foo.png'
    end
  end

  def test_display
    Image.create!(image_url: 'http://abc.png', created_at: 5.minutes.ago)
    Image.create!(image_url: 'https://dfs.jpg')

    get root_path
    assert_select 'img', 2 do |images|
      assert_equal 'https://dfs.jpg', images[0].attributes['src'].value
      assert_equal 'http://abc.png', images[1].attributes['src'].value
    end
  end

  def test_images_with_tag
    Image.create!(image_url: 'http://abc.png', tag_list: 'test1, test3')
    Image.create!(image_url: 'https://dfs.jpg', tag_list: 'test1, test2')
    Image.create!(image_url: 'https://bfs.jpg', tag_list: 'test2, test3')

    get images_path(tag: 'test2')
    assert_select 'img', 2 do |images|
      assert_equal 'https://bfs.jpg', images[0].attributes['src'].value
      assert_equal 'https://dfs.jpg', images[1].attributes['src'].value
    end
  end

  def test_destroy
    image = Image.create!(image_url: 'http://abc.png', tag_list: 'test1, test3')
    assert_difference 'Image.count', -1 do
      delete image_path(image)
    end
    assert_redirected_to images_path
    follow_redirect!
    assert_select 'h1', text: 'Listing Images'
    assert_select 'img', count: 0
  end
end
