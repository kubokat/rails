class FeedbackController < ApplicationController

  def index
  end

  def send_feedback
    if params[:body].present?
      TestsMailer.feedback(params[:body]).deliver_now
      flash_options = { notice: 'Message sent' }
      redirect_to feedback_index_url, flash_options
    else
      render :index
    end
  end

end
