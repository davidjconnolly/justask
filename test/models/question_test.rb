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

  def test_set_default_ordinals
    page = a Page

    question1 = Question.create_dummy!(page: page)
    question2 = Question.create_dummy!(page: page)
    question3 = Question.create_dummy!(page: page)

    question1.reload
    question2.reload
    question3.reload

    assert_equal Question::ORDINAL_INCREMENT, question1.ordinal
    assert_equal Question::ORDINAL_INCREMENT * 2, question2.ordinal
    assert_equal Question::ORDINAL_INCREMENT * 3, question3.ordinal
  end

  def test_set_custom_ordinals
    page = a Page

    question1 = Question.create_dummy!(page: page, ordinal: Question::ORDINAL_INCREMENT)
    question2 = Question.create_dummy!(page: page, ordinal: Question::ORDINAL_INCREMENT * 100)
    question3 = Question.create_dummy!(page: page, ordinal: Question::ORDINAL_INCREMENT + (Question::ORDINAL_INCREMENT/2).to_i)

    question1.reload
    question2.reload
    question3.reload

    assert_equal Question::ORDINAL_INCREMENT, question1.ordinal
    assert_equal Question::ORDINAL_INCREMENT * 2, question3.ordinal
    assert_equal Question::ORDINAL_INCREMENT * 3, question2.ordinal
  end

  def test_update_ordinals
    page = a Page

    question1 = Question.create_dummy!(page: page)
    question2 = Question.create_dummy!(page: page)
    question3 = Question.create_dummy!(page: page)

    question1.update_attribute(:ordinal, Question::ORDINAL_INCREMENT * 5)
    question2.update_attribute(:ordinal, Question::ORDINAL_INCREMENT * 5)

    question1.reload
    question2.reload
    question3.reload

    assert_equal Question::ORDINAL_INCREMENT, question3.ordinal
    assert_equal Question::ORDINAL_INCREMENT * 2, question1.ordinal
    assert_equal Question::ORDINAL_INCREMENT * 3, question2.ordinal
  end

end
