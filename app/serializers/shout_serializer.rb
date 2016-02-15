class ShoutSerializer < ActiveModel::Serializer
  attribute :id
  attribute :message
  attribute :created_at

  belongs_to :user
end
