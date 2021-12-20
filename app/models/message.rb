class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :message_body, :conversation_id, :user_id
  def message_time
    created_at.strftime('%m/%d/  %l:%M ')
  end
end
