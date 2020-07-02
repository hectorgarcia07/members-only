require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid data should not create user" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, params: {user: {email: "", 
                                              password: "", 
                                              username: ""}}
    end
    assert_template "devise/registrations/new"
  end

  test "valid data should create user" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: {user: {email: "test@testing.com", 
                                              password: "testing123", 
                                              username: "testing123"}}
    end
    follow_redirect!
    assert_template "posts/index"
  end
  
end
