class AnimeTag < ApplicationRecord
  belongs_to :anime
  belongs_to :tag
end
