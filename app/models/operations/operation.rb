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
  has_many :aars
  has_many :addons
  has_many :groups
  has_many :play_with_sixes
  has_many :slots, through: :groups

  before_save :set_updated_at
  before_save :fix_start, if: ->(obj){ obj.start.present? and obj.start_changed? }

  default_scope { includes(:author) }
  scope :hidden, -> { where(hidden: true) }
  scope :published, -> { where(hidden: false) }
  scope :upcoming, -> { where('operation_datetime >= ?', DateTime.now.beginning_of_day) }

  def set_updated_at
    self.updated_at = utc_to_local(Time.now.utc)
  end

  def fix_start
    self.start = utc_to_local(self.start)
  end

  def number_of_participants
    if (self.slots.loaded?)
      self.slots.select{|slot| !slot.user_id.nil?}.size
    else
      self.slots.where.not(user_id: nil).size
    end
  end

  def number_of_slots
    self.slots.size
  end

  def participating?(user)
    if (self.slots.loaded?)
      return self.slots.select{|slot| slot.user_id == user.id}.size > 0 if user
    else
      return self.slots.where(user_id: user.id).size > 0 if user
    end
    false
  end
end
