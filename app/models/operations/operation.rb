class Operations::Operation < ApplicationRecord
  alias_attribute :id, :operation_id
  alias_attribute :title, :operation_title
  alias_attribute :text, :operation_text
  alias_attribute :image, :operation_image
  alias_attribute :start, :operation_datetime
  alias_attribute :hidden, :operation_hidden
  alias_attribute :locked, :operation_locked
  alias_attribute :author_id, :operation_author
  alias_attribute :updated_at, :operation_updated_at

  belongs_to :author, class_name: 'User', foreign_key: 'operation_author'
  has_many :addons
  has_many :play_with_sixes

  before_save :set_updated_at

  default_scope { includes(:author) }

  def set_updated_at
    self.updated_at = Time.now.utc
  end
end
