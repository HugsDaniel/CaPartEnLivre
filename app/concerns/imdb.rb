module Imdb
  class Item
    attr_reader :title, :name, :overview, :original_title, :release_date, :poster_path, :genres

    def initialize(attributes = {})
      @title            = attributes[:title]
      @overview         = attributes[:overview]
      @original_title   = attributes[:original_title]
      @release_date     = attributes[:release_date]
      @poster_path      = "https://image.tmdb.org/t/p/w500#{attributes[:poster_path]}"
      @genres           = Genre.where(tmdb_id: attributes[:genres])&.map(&:name)&.join(', ')
    end
  end

  def self.search_movie(query)
    response = JSON.parse(open(URI.escape("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=fr-FR&query=#{query}&page=1&include_adult=false")).read)

    response['results'].map do |item|
      Item.new(
        title:            item['title'],
        overview:         item['overview'],
        original_title:   item['original_title'],
        release_date:     item['release_date']&.[](0..3),
        poster_path:      item['poster_path'],
        genres:           item['genre_ids']
      )
    end
  end

  def self.search_series(query)
    response = JSON.parse(open(URI.escape("https://api.themoviedb.org/3/search/tv?api_key=#{ENV['TMDB_API_KEY']}&language=fr-FR&query=#{query}&page=1")).read)

    response['results'].map do |item|
      Item.new(
        title:            item['name'],
        overview:         item['overview'],
        release_date:     item['first_air_date']&.[](0..3),
        poster_path:      item['poster_path']
      )
    end
  end
end
