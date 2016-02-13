class OperationSerializer < ActiveModel::Serializer
  attribute :id
  attribute :title
  attribute :text

  belongs_to :author
end
