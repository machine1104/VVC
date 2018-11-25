require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get registrazione_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { username:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar",
                                         comune: "",
                                         data_nascita: "" 
                                        }
                                }
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get registrazione_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username:  "ExampleUser",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password",
                                         comune: "Roma",
                                         data_nascita: "2000/01/01" 
                                        }
                                }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert is_logged_in?
  end
  
end