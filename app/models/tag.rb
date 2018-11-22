class Tag < ApplicationRecord
  has_many :anime_tags
  has_many :anime, through: :anime_tags

end
