require "test_helper"

class MedicalTeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get medical_teams_new_url
    assert_response :success
  end
end
