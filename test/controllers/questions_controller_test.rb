require_relative '../test_helper'

class QuestionsControllerTest < ActionController::TestCase

  test "should update question" do
    old_text = 'old'
    new_text = 'new'

    question = a Question
    question.update_attributes(text: old_text)

    patch :update,
      id: question.to_param,
      question: {
        text: new_text
      }

    assert_response :redirect
    question.reload
    assert_equal new_text, question.text
  end

end
