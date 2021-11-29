class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatroom = current_user.chatroom
    if current_user.chatroom_id?
      redirect_to chatroom_path(@chatroom)
    end
  end
end
