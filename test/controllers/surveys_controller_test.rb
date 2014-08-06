require_relative '../test_helper'

class SurveysControllerTest < ActionController::TestCase

  test "should update survey" do
    old_title = 'old'
    new_title = 'new'

    survey = a Survey
    survey.update_attributes(title: old_title)

    patch :update,
      id: survey.to_param,
      survey: {
        title: new_title
      }

    assert_response :redirect
    survey.reload
    assert_equal new_title, survey.title
  end

end
