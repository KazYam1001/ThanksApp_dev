class ThanksController < ApplicationController

  # def index
  #   @sended_thanks = current_user.sended_thanks
  #   @current_user_groups = current_user&.groups
  #   @send_thanks = []
  #   @receivers = []
  #   @sended_thanks.each do |send_thank|
  #     @send_thanks << send_thank
  #     receiver = send_thank.receiver
  #     receiver_name = send_thank.receiver.family_name + send_thank.receiver.given_name
  #     data = {name: receiver_name, avatar: send_thank.receiver.avatar.url }
  #     @receivers << data
  #   end

  #   respond_to do |format|
  #     format.html
  #     format.json
  #   end
  # end

  # def edit
  #   @thank = Thank.find(params[:id])
  #   @login_avatar = ""
  #   @receiver_avatar = ""

  #   @login_user = {user: current_user, avatar: current_user.avatar.url}
  #   @receiver_user = {user: @thank.receiver, avatar: @thank.receiver.avatar.url}

  #   respond_to do |format|
  #     format.html
  #     format.json
  #   end
  # end

  # def create
  #   thank = Thank.new(thank_params)
  #   thank.transmission_status = true if params[:thank][:transmission_status] == true
  #   if thank.save
  #     render json: thank, status: :created
  #   else
  #     render json: { errors: thank.errors.full_messages }
  #   end
  # end

  # def update
  #   thank = Thank.find(params[:id])
  #   if thank.update(update_params)
  #     render json: thank, status: :created
  #   else
  #     render json: { errors: thank.errors.full_messages }
  #   end
  # end

  # def destroy
  #   thank = Thank.find(params[:id])
  #   if thank.delete
  #     render json: thank, status: :created
  #   else
  #     render json: { errors: thank.errors.full_messages }
  #   end
  # end

  # private

  # def thank_params
  #   params.require(:thank).permit(:text, :receiver_id).merge(sender_id: current_user.id, group_id: current_user.groups.first.root_id)
  # end

  # def update_params
  #   params.permit(:text, :transmission_status)
  # end
end
