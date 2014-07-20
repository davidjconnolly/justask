class PagesController < ApplicationController

  before_filter :load_activity

  def update
    @page.update_attributes!(page_params)
    render json: {success: true}
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
