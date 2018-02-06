require 'test_helper'

class SayControllerTest < ActionDispatch::IntegrationTest
  test "should get good" do
    get say_good_url
    assert_response :success
  end

  test "should get awesome" do
    get say_awesome_url
    assert_response :success
  end

end
