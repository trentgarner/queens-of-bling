require "test_helper"

class ModelApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get model_applications_new_url
    assert_response :success
  end

  test "should get create" do
    get model_applications_create_url
    assert_response :success
  end
end
