require_relative '../test_helper'

class ClientControllerTest < ActionController::TestCase

  test "should get index" do
    surveys = []
    5.times do
      surveys << (a Survey)
    end

    get :index

    assert_response :success
  end

end
