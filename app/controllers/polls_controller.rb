class PollsController < ApplicationController

  def index 
    @poll = Poll.where(finished_at: nil).last
    @poll_options = @poll.poll_options.order :name
  end

  def vote 
    @poll_option = PollOption.find params[:poll_option_id]
    @poll_option.increment! :votes

    respond_to do |format|
      format.turbo_stream { render :vote }
    end
  end
end
