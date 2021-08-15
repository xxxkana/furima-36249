class MessagesController < ApplicationController
  
  def create
    @message = Message.new(text: params[:message][:text], item_id: params[:item_id])
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end
end
