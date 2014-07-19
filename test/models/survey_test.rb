require_relative '../test_helper'

class SurveyTest < ActiveSupport::TestCase

  def test_create_defaults
    survey = Survey.create(
      title: "Example Survey"
    )

    assert_created survey
  end

  def test_create_dummy
    survey = a Survey

    assert_created survey
  end

  def test_create_requirements
    survey = Survey.create

    assert_not_created survey
    assert_errors_on survey, :title
  end

  def test_restricts_delete
    survey = Survey.create(
      title: "Example Survey",
      pages: [(a Page)]
    )

    assert_exception_raised ActiveRecord::RecordNotDestroyed do
      survey.destroy!
    end
  end

end
