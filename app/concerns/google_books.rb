module GoogleBooks
  class Item
    attr_reader :title, :description, :authors, :published_date, :image_link, :genres

    def initialize(attributes = {})
      @title          = attributes[:title]
      @description    = attributes[:description]
      @authors        = attributes[:authors]
      @published_date = attributes[:published_date]
      @image_link     = attributes[:image_link]
      @genres         = attributes[:genres]
    end
  end

  def self.search(query)
    response = JSON.parse(open(URI.escape("https://www.googleapis.com/books/v1/volumes?q=#{query}&langRestrict=fr&maxResults=10")).read)

    response['items'].map do |item|
      Item.new(
        title:          item['volumeInfo']['title'],
        description:    item['volumeInfo']['description'],
        authors:        item['volumeInfo']['authors']&.join(', '),
        published_date: item['volumeInfo']['publishedDate']&.[](0..3),
        image_link:     item['volumeInfo']['imageLinks']&.[]('thumbnail'),
        genres:         item['volumeInfo']['categories']
      )
    end
  end
end
