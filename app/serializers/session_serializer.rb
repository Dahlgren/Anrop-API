class SessionSerializer < ActiveModel::Serializer
  attribute :token

  belongs_to :user
end
