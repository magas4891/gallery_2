require 'test_helper'

class Users::OmniauthCallBacksControllerTest < ActionDispatch::IntegrationTest
  test "should get facebook" do
    get users_omniauth_call_backs_facebook_url
    assert_response :success
  end

end
