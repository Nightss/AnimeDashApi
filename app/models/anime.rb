class Anime < ApplicationRecord
  self.table_name = "anime"
  # has_many :anime_tags
  # has_many :tags, through: :anime_tags
  has_and_belongs_to_many :tags

  validates_presence_of :title,
                        :description,
                        :type,
                        :start_date,
                        :end_date

end
