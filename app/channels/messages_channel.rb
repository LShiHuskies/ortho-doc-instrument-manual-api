# mount ActionCable.server => "/cable"
class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # conversation = Conversation.find(params[:id])
    byebug
    stream_from "MessagesChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end