require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "Informazioni | Ruby on Rails Tutorial Sample App"
  end

  test "should get contatti" do
    get static_pages_contatti_url
    assert_response :success
    assert_select "title", "Contatti | Ruby on Rails Tutorial Sample App"
  end

end
