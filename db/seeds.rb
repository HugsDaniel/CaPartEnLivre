# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning DB..."
Group.destroy_all
Genre.destroy_all

puts "Seeding genre..."
movie_response = JSON.parse(open(URI.escape("https://api.themoviedb.org/3/genre/movie/list?api_key=#{ENV['TMDB_API_KEY']}&language=fr-FR")).read)
series_response = JSON.parse(open(URI.escape("https://api.themoviedb.org/3/genre/tv/list?api_key=#{ENV['TMDB_API_KEY']}&language=fr-FR")).read)

genres = (movie_response['genres'] + series_response['genres']).uniq
genres.each do |genre|
  Genre.create!(
    tmdb_id: genre['id'],
    name: genre['name']
  )
end

puts "Done"
