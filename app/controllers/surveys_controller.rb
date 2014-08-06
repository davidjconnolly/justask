class SurveysController < ApplicationController

  before_filter :load_activity

  def update
    @survey.update_attributes!(survey_params)
    redirect_to :back

  rescue ActionController::RedirectBackError
    redirect_to admin_surveys_path
  end

protected
  def load_activity
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.fetch(:survey, { }).permit(
      :title,
      :description
    )
  end

end
