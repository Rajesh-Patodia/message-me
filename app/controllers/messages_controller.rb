class MessagesController < ApplicationController

  before_action :require_user

  def create
    message = current_user.messages.build(whitelist)
    if(message.save)
      ActionCable.server.broadcast "chatroom_channel", modified_message: message_render(message)
    end
  end

  private

  def whitelist
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message',locals: {message: message})
  end
end