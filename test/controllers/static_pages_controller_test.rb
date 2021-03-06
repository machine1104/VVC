require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Vieni, Vedi, Compra!"
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Informazioni | #{@base_title}"
  end

  test "should get contatti" do
    get contatti_path
    assert_response :success
    assert_select "title", "Contatti | #{@base_title}"
  end

end
