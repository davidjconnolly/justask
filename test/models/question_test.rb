require_relative '../test_helper'

class QuestionTest < ActiveSupport::TestCase

  def test_create_defaults
    question = Question.create(
      text: "Example Question",
      page: (a Page)
    )

    assert_created question
  end

  def test_create_dummy
    question = a Question

    assert_created question
  end

  def test_create_requirements
    question = Question.create

    assert_not_created question
    assert_errors_on question, :page
  end

  def test_restricts_delete
    question = Question.create(
      text: "Example Question",
      page: (a Page),
      response: (a Response)
    )

    assert_exception_raised ActiveRecord::RecordNotDestroyed do
      question.destroy!
    end
  end

end
