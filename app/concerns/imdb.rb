require 'open-uri'

module Imdb
  class Item
    attr_reader :title, :overview, :original_title, :release_date, :poster_path

    def initialize(attributes = {})
      @title            = attributes[:title]
      @overview         = attributes[:overview]
      @original_title   = attributes[:original_title]
      @release_date     = attributes[:release_date]
      @poster_path      = attributes[:poster_path]
    end
  end

  def self.search(query)
    response = JSON.parse(open(URI.escape("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['TMDB_API_KEY']}&language=fr-FR&query=#{query}&page=1&include_adult=false")).read)

    response['results'].map do |item|
      Item.new(
        title:            item['title'],
        overview:         item['overview'],
        original_title:   item['original_title'],
        release_date:     item['release_date']&.[](0..3),
        poster_path:      item['poster_path']
      )
    end
  end
end
