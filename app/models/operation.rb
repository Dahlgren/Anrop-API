class Operation < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: 'operation_author'
end
