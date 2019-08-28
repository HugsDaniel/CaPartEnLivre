module Igdb
  class Item
    attr_reader :name, :released, :platforms, :background_image, :description, :devs

    def initialize(attributes = {})
      @name             = attributes[:name]
      @released         = attributes[:released]
      @platforms        = attributes[:platforms]
      @background_image = attributes[:background_image]
      @description      = attributes[:description]
      @devs             = attributes[:devs]
    end
  end

  def self.search(query)
    response = JSON.parse(open(URI.escape("https://api.rawg.io/api/games?page_size=5&search=#{query}")).read)

    response['results'].map do |item|
      details = JSON.parse(open(URI.escape("https://api.rawg.io/api/games/#{item['slug']}")).read)

      Item.new(
        name:             item['name'],
        released:          item['released']&.[](0..3),
        platforms:        item['platforms']&.map { |p| p['platform']['name'] }&.join(", "),
        background_image: item['background_image'],
        description:      details['description'],
        devs:             details['developers']&.map { |p| p['name'] }&.join(", ")
      )
    end
  end
end
