require_relative '../test_helper'

class AdminControllerTest < ActionController::TestCase

  test "should get surveys" do
    surveys = []
    5.times do
      surveys << (a Survey)
    end

    get :surveys

    assert_response :success
  end

end
