class MessagesController < ApplicationController
  def new
    @message = Message.new
    @messages = Message.all

  end

  def create
    @message = Message.new(text: params[:message][:text])
  end
end
