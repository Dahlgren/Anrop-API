class Operations::Addon < ApplicationRecord
  self.table_name = self.table_name_prefix + 'operations_addons'

  alias_attribute :id, :addon_id
  alias_attribute :name, :addon_name
  alias_attribute :url, :addon_url
  alias_attribute :updated_at, :addon_updated_at

  belongs_to :operation

  before_save :set_updated_at

  def set_updated_at
    self.updated_at = Time.now.utc
  end
end
