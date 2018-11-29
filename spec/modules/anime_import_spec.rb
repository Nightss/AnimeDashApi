RSpec.describe AnimeImport do
  let(:anime_import) { Class.new.include(AnimeImport).new }

  describe '#create_endpoint' do

    it 'does accept anime id as a parameter' do
      expect(anime_import).to receive(:create_endpoint).with(Integer)
      anime_import.create_endpoint(1)
    end

    it 'returns a API endpoint' do
      expect(anime_import.create_endpoint(1)).to be_a(String)
    end

  end

  describe '#fetch_data' do

    it "does accept anime id as a parameter" do
      expect(anime_import).to receive(:fetch_data).with(Integer)
      anime_import.fetch_data(1)
    end

    it "does return a response" do
      expect(anime_import.fetch_data(1)).to be_a(RestClient::Response)
    end

    it "response should respond with success" do
      response = anime_import.fetch_data(1).code
      expect(response).to eq(200)
    end

    it "response body should be valid xml" do
      xml = anime_import.fetch_data(1).body
      expect(Nokogiri.XML(xml) {|config| config.strict}).to be_a(Nokogiri::XML::Document)
    end
  end

  describe '#filter_data' do
    let(:response) {anime_import.fetch_data(1)}

    it "does accept payload as a parameter" do
      expect(anime_import).to receive(:filter_data).with(RestClient::Response)
      anime_import.filter_data(response)
    end

    it "does return a anime hash" do
      expect(anime_import.filter_data(response)).to include(:en_title,
                                                            :jp_title,
                                                            :description,
                                                            :type,
                                                            :episode_count,
                                                            :start_date,
                                                            :end_date,
                                                            :picture,
                                                            tags: be_a(Array)
                                                            )
    end



  end
end
