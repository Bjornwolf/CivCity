require 'test_helper'

class TurnControllerTest < ActionController::TestCase
  test "should get next" do
    get :next
    assert_response :success
  end

end
