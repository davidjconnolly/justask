class AdminController < ApplicationController

  def surveys
    @surveys = Survey.all.paginate :page => params[:page], :per_page => 10
  end

end
