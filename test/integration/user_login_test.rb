require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  test "login test" do
    get '/users/sign_in'
    assert_response :success

    post '/users/sign_in',
    params: { email: 'ahyoung@hotmail.com', password: 'password',
      referer: records_path }
    assert_response :success

  end

end
