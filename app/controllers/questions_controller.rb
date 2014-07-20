class QuestionsController < ApplicationController

  before_filter :load_activity

  def update
    @question.update_attributes!(question_params)
    render json: {success: true}
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
