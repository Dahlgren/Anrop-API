class Operation < ApplicationRecord
  alias_attribute :id, :operation_id
  alias_attribute :title, :operation_title
  alias_attribute :text, :operation_text

  belongs_to :author, class_name: "User", foreign_key: 'operation_author'
end
