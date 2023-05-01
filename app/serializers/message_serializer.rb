class MessageSerializer < ActiveModel::Serializer
  attributes :user_id, :conversation_id, :message, :created_at, :updated_at
  belongs_to :user
  belongs_to :conversation
end