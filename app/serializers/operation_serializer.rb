class OperationSerializer < ActiveModel::Serializer
  attribute :id
  attribute :title
  attribute :text
  attribute :image
  attribute :start
  attribute :hidden
  attribute :locked

  belongs_to :author

  def hidden
    object.hidden == 1
  end

  def locked
    object.locked == 1
  end
end
