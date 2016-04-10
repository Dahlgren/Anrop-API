class Operations::AddonSerializer < ActiveModel::Serializer
  attribute :id
  attribute :operation_id
  attribute :name
  attribute :url
end
