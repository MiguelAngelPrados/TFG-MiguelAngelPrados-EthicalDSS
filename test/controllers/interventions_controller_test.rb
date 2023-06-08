require "test_helper"

class InterventionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get interventions_index_url
    assert_response :success
  end
end
