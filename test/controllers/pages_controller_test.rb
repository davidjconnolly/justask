require_relative '../test_helper'

class PagesControllerTest < ActionController::TestCase

  test "should update page" do
    old_title = 'old'
    new_title = 'new'

    page = a Page
    page.update_attributes(title: old_title)

    patch :update,
      id: page.to_param,
      page: {
        title: new_title
      }

    assert_response :redirect
    page.reload
    assert_equal new_title, page.title
  end

end
