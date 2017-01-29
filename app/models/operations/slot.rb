class Operations::Slot < ApplicationRecord
  self.table_name = self.table_name_prefix + 'operations_slots'

  alias_attribute :id, :slot_id
  alias_attribute :name, :slot_title
  alias_attribute :order, :slot_order
  alias_attribute :updated_at, :slot_updated_at

  belongs_to :group
  has_one :operation, through: :group
  belongs_to :user

  before_save :default_values
  before_save :set_updated_at

  default_scope { includes(:user) }

  def default_values
    self.order ||= 0
  end

  def set_updated_at
    self.updated_at = utc_to_local(Time.now.utc)
  end
end
