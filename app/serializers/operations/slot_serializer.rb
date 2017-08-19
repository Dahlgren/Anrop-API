class Operations::SlotSerializer < ActiveModel::Serializer
  attribute :id
  attribute :group_id
  attribute :operation_id
  attribute :name
  attribute :locked
  attribute :order

  belongs_to :user

  def operation_id
    object.group.operation.id
  end
end
