class TransmissionsController < ApplicationController
  def index
    @sended_thanks = current_user.sended_thanks
    @send_thanks = []
    @receivers = []
    @sended_thanks.each do |send_thank|
      @send_thanks << send_thank
      @receivers   << send_thank.receiver.name
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
end
