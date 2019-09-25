module ListenApi
  class Item
    attr_reader :title, :image, :description, :genres, :publisher

    def initialize(attributes = {})
      @title             = attributes[:title]
      @image            = attributes[:image]
      @description      = attributes[:description]
      @publisher             = attributes[:publisher]
      @genres           = attributes[:genres]
    end
  end

  def self.search(query)
    response = JSON.parse(
                      open(URI.escape("https://listen-api.listennotes.com/api/v2/search?q=#{query}&sort_by_date=0&type=podcast&offset=0&only_in=title%2Cdescription"),
                        "X-ListenAPI-Key" => ENV["LISTEN_API_KEY"],
                      ).read)

    response['results'].map do |item|
      Item.new(
        title:        item['title_original'],
        genres:       item['genre_ids'],
        image:        item['image'],
        description:  item['description_original'],
        publisher:    item['publisher_original']
      )
    end
  end
end
