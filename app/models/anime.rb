class Anime < ApplicationRecord
  self.table_name = "anime"
  has_many :anime_tags
  has_many :tags, through: :anime_tags
end
