require 'test_helper'

class EditUserTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in(:hector)
  end

  test "non logged in user won't be able to edit other users profile" do
    sign_out users(:hector)
    get edit_user_registration_path
    assert_redirected_to new_user_session_path
  end

  
end
