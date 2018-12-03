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

  def test_show
    image = Image.create(image_url: 'http://foo.png')
    get image_path(image)

    assert_response :ok
    assert_select 'img' do
      assert_select '[src=?]', 'http://foo.png'
    end
  end
end
