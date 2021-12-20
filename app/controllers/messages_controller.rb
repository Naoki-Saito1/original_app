class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end
  def index
    @conversation
    @conversations = Conversation.all
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = Message.where(id: @messages[-10..-1].pluck(:id))
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    @messages.where.not(user_id: current_user.id).update_all(message_read: true) if @messages.last
    @messages = @messages.order(:created_at)
    @message = @conversation.messages.build
    @recipient = User.find(Conversation.find(params[:conversation_id]).recipient_id)
    @sender = User.find(Conversation.find(params[:conversation_id]).sender_id)
  end

  def create
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation), data: {
        "turbolinks"=>false}
    else
      render 'index'
    end
  end

  private

  def message_params
    params.require(:message).permit(:message_body, :user_id)
  end
end
