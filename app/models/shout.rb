class Shout < ApplicationRecord
  self.table_name = self.table_name_prefix + 'shoutbox'

  alias_attribute :id, :shout_id
  alias_attribute :message, :shout_message
  alias_attribute :ip, :shout_ip
  alias_attribute :created_at, :shout_datestamp
  alias_attribute :user_id, :shout_name

  belongs_to :user, class_name: 'User', foreign_key: 'shout_name'

  before_save :set_created_at

  def set_created_at
    self.created_at = Time.now.utc
  end
end
