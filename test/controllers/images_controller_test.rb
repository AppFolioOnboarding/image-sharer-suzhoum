require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  def test_new
    get new_image_path

    assert_response :ok
    assert_select 'h1', text: 'New Image'
    assert_select '#error_explanation', count: 0
  end
end
