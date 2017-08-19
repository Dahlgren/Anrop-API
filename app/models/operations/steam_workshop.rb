class Operations::SteamWorkshop < ApplicationRecord
  self.table_name = self.table_name_prefix + 'operations_steam_workshop'

  belongs_to :operation
end
