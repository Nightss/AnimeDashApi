module AnimeImport
  # extend self
  require 'rest-client'

  ANIME_ENDPOINT = "http://api.anidb.net:9001/httpapi?"

  def create_endpoint(client = "animealert", client_version="1",protover="1",request="anime", aid)
    endpoint = %Q(
    #{ANIME_ENDPOINT}
    request=#{request}
    &client=#{client}
    &clientver=#{client_version}
    &protover=#{protover}
    &aid=#{aid}
    )
    return endpoint.remove("\n").remove(" ")
  end

  def fetch_data(aid)
    endpoint = create_endpoint(aid)
    response = RestClient.get(endpoint)
    return response
  end

  def filter_data(payload)
    xml = Nokogiri.XML(payload.body){|config| config.strict }
    anime = {en_title: nil,
             jp_title: nil,
             description: nil,
             type: nil,
             episode_count: nil,
             start_date: nil,
             end_date: nil,
             picture: nil,
             tags: []}
    anime[:en_title] = xml.xpath("anime//titles//title[@xml:lang='en'][@type='official']").text
    anime[:jp_title] = xml.xpath("anime//titles//title[@xml:lang='x-jat'][@type='main']").text
    anime[:description] = xml.xpath("anime//description").text
    anime[:type] = xml.xpath("anime//type").text
    anime[:episode_count] = xml.xpath("anime//episodecount").text
    anime[:start_date] = xml.xpath("anime//startdate").text
    anime[:end_date] = xml.xpath("anime//enddate").text
    anime[:picture] = xml.xpath("anime//picture").text
    xml.xpath("anime//tags").each do |tag|
      tag_data = {name: nil, description: nil}
      tag_data[:name] = tag.xpath("name").text
      tag_data[:description] = tag.xpath("description").text
      anime[:tags] << tag_data
    end
    return xml
  end

  def create_anime(anime_values)
    Anime.create(
      title: "",
      description: "",
      type: "",
      episode_count: "",
      picture: "",
      start_date: "",
      end_date: ""
    )
  end
end
