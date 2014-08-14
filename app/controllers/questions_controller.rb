class QuestionsController < ApplicationController

  before_filter :load_activity

  def update
    @question.update_attributes!(question_params)
    redirect_to :back

  rescue ActionController::RedirectBackError
    redirect_to admin_surveys_path
  end

protected
  def load_activity
    @question = Question.find(params[:id])
  end

  def question_params
    params.fetch(:question, { }).permit(
      :question_type,
      :page_id,
      :ordinal,
      :text,
      :fields
    )
  end

end
