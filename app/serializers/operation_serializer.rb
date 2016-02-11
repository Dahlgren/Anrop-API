class OperationSerializer < ActiveModel::Serializer
  attribute :id
  attribute :operation_title
  attribute :operation_text

  belongs_to :author
end
