require 'rails_helper'

RSpec.describe Anime, :type => :model do
  # let(:anime) { Anime.new(
  #   title: "God",
  #   description: "Story of Jordan",
  #   type: "TV",
  #   start_date: Date.today,
  #   end_date: Date.today.next_quarter
  #   ) }
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:type)}
  it {should validate_presence_of(:start_date)}
  it {should have_many(:tags).through(:anime_tags)}
  # before(:each) do
  #   @anime = Anime.new()
  #   @anime.title = "God"
  #   @anime.description = "Story of Jordan"
  #   @anime.type = "TV"
  #   @anime.start_date = Date.today
  #   @anime.end_date = Date.today.next_quarter
  #
  #   @tag = Tag.new()
  #   @tag.name = "Tragedy"
  # end

  # describe "Associations" do
  #   @anime.tags << @tag
  #   it { should have_and_belong_to_many(:tags) }
  # end
end
