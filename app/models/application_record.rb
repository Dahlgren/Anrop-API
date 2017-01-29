class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.table_name_prefix = 'fusion7_'

  def utc_to_local(value)
    ActiveSupport::TimeZone.new('Europe/Stockholm').utc_to_local(value)
  end
end
