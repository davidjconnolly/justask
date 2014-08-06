class PagesController < ApplicationController

  before_filter :load_activity

  def update
    @page.update_attributes!(page_params)
    redirect_to :back

  rescue ActionController::RedirectBackError
    redirect_to admin_surveys_path
  end

protected
  def load_activity
    @page = Page.find(params[:id])
  end

  def page_params
    params.fetch(:page, { }).permit(
      :survey_id,
      :ordinal,
      :title,
      :description,
      :text
    )
  end

end
