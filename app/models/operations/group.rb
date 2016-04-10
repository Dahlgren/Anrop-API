class Operations::Group < ApplicationRecord
  self.table_name = self.table_name_prefix + 'operations_groups'

  alias_attribute :id, :group_id
  alias_attribute :name, :group_title
  alias_attribute :order, :group_order
  alias_attribute :updated_at, :group_updated_at

  belongs_to :operation

  before_save :default_values
  before_save :set_updated_at

  def default_values
    self.order ||= 0
  end

  def set_updated_at
    self.updated_at = Time.now.utc
  end
end
