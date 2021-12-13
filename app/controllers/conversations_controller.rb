class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @conversations = Conversation.all
  end

  def create
    @conversation = if Conversation.between(params[:sender_id], params[:recipient_id]).present?
                      Conversation.between(params[:sender_id], params[:recipient_id]).first
                    else
                      Conversation.create!(conversation_params)
                    end
    redirect_to conversation_messages_path(@conversation), notice: 'トークルーム作成されました'
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
