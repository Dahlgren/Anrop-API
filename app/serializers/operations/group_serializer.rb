class Operations::GroupSerializer < ActiveModel::Serializer
  attribute :id
  attribute :operation_id
  attribute :name
  attribute :order
end
