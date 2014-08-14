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

  def test_set_ordinals
    survey = a Survey

    page1 = Page.create_dummy!(survey: survey)
    page2 = Page.create_dummy!(survey: survey)
    page3 = Page.create_dummy!(survey: survey)

    page1.reload
    page2.reload
    page3.reload

    assert_equal Page::ORDINAL_INCREMENT, page1.ordinal
    assert_equal Page::ORDINAL_INCREMENT * 2, page2.ordinal
    assert_equal Page::ORDINAL_INCREMENT * 3, page3.ordinal
  end

end
