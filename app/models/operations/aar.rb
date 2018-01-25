class Operations::Aar < ApplicationRecord
  self.table_name = self.table_name_prefix + 'operations_aar'

  belongs_to :operation
end
