class ApplicationSerializer < ActiveModel::Serializer
  def local_to_utc(value)
    ActiveSupport::TimeZone.new('Europe/Stockholm').local_to_utc(value)
  end
end
