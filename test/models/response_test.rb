require_relative '../test_helper'

class ResponseTest < ActiveSupport::TestCase

  def test_create_defaults
    response = Response.create(
      fields: {},
      question: (a Question)
    )

    assert_created response
  end

  def test_create_dummy
    response = a Response

    assert_created response
  end

  def test_create_requirements
    response = Response.create

    assert_not_created response
    assert_errors_on response, :question
  end

end
