require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
  test "user can be logged in" do
    sign_in users(:one)
    get links_path
    assert_select "a", "Profile"
  end

  test "guest user" do
    get links_path
    assert_select "a", "Sign Up"
    assert_select "a", "Login"
  end
end
