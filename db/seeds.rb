# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
response = JSON.parse(open(URI.escape("https://api.themoviedb.org/3/genre/movie/list?api_key=2df34b7e4dcdd0c9b043791a36ab8386&language=fr-FR")).read)

genres = response['genres']
genres.each do |genre|
  Genre.create!(
    tmdb_id: genre['id'],
    name: genre['name']
  )
end
