require_relative '../test_helper'

class PageTest < ActiveSupport::TestCase

  def test_create_defaults
    page = Page.create(
      title: "Example Page",
      survey: (a Survey)
    )

    assert_created page
  end

  def test_create_dummy
    page = a Page

    assert_created page
  end

  def test_create_requirements
    page = Page.create

    assert_not_created page
    assert_errors_on page, :survey
  end

  def test_restricts_delete
    page = Page.create(
      title: "Example Page",
      survey: (a Survey),
      questions: [(a Question)]
    )

    assert_exception_raised ActiveRecord::RecordNotDestroyed do
      page.destroy!
    end
  end

end
