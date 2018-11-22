class Tag < ApplicationRecord
  # has_many :anime_tags
  # has_many :anime, through: :anime_tags
  has_and_belongs_to_many :anime

end
