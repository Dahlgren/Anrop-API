class Operations::PlayWithSix < ApplicationRecord
  self.table_name = self.table_name_prefix + 'operations_pws'

  alias_attribute :id, :pws_id
  alias_attribute :name, :pws_name
  alias_attribute :updated_at, :pws_updated_at

  belongs_to :operation

  before_save :set_updated_at

  def set_updated_at
    self.updated_at = Time.now.utc
  end
end
