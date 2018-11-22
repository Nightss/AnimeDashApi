require 'rails_helper'

RSpec.describe Anime, :type => :model do
  before(:each) do
    @anime = Anime.new()
    @anime.title = "God"
    @anime.description = "Story of Jordan"
    @anime.type = "TV"
    @anime.start_date = Date.today
    @anime.end_date = Date.today.next_quarter

    @tag = Tag.new()
    @tag.name = "Tragedy"
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(@anime).to be_valid
    end

    it "is not valid without a title" do
      @anime.title = nil
      expect(@anime).to_not be_valid
    end

    it "is not valid without a description" do
      @anime.description = nil
      expect(@anime).to_not be_valid
    end

    it "is not valid without a type" do
      @anime.type = nil
      expect(@anime).to_not be_valid
    end

    it "is not valid without a start_date" do
      @anime.start_date = nil
      expect(@anime).to_not be_valid
    end

    it "is not valid without a end_date" do
      @anime.end_date = nil
      expect(@anime).to_not be_valid
    end
  end

  describe "Associations" do
    @anime.tags << @tag
    it { should have_and_belong_to_many(:tags) }
  end
end
