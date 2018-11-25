require 'rails_helper'

RSpec.describe Tag, :type => :model do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:description)}
  it {should have_many(:anime).through(:anime_tags)}
end
