require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  def test_image__valid
    image = Image.new(image_url: 'http://fake.jpg')
    assert_predicate image, :valid?
  end

  def test_image__invalid
    image = Image.new(image_url: 'fake.jpg')
    assert_not_predicate image, :valid?
  end
end
