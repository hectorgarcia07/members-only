require 'test_helper'

class EditUserTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "non logged in user won't be able to edit other users profile" do
    sign_in users(:hector)
  end
end
