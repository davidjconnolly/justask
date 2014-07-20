require_relative '../test_helper'

class AdminControllerTest < ActionController::TestCase

  test "should get surveys" do
    log_books = []
    5.times do
      log_books << (a Survey)
    end

    get :surveys

    assert_response :success
  end

end
