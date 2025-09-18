require "test_helper"

class GalleryImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gallery_images_index_url
    assert_response :success
  end
end
