# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
studio = Studio.create(name: "Joe's town", location: "here")
movie1 = studio.movies.create!(title: "Joe's Onlyfans", creation_year: 1979, genre: "fiction")
movie2 = studio.movies.create!(title: "Another Antman", creation_year: 2027, genre: "non-ficiton")
actor1 = Actor.create!(name: "Joe Not Galvin", age: 25)
actor2 = Actor.create!(name: "Joe Galvin", age: 43)
actor3 = Actor.create!(name: "Not Galvin", age: 30)
actor4 = Actor.create!(name: "A Galvin", age: 65)
actor5 = Actor.create!(name: "B Galvin", age: 29)
actor_mov1 = ActorMovie.create!(actor_id: actor1.id, movie_id: movie1.id)
actor_mov2 = ActorMovie.create!(actor_id: actor2.id, movie_id: movie1.id)
actor_mov3 = ActorMovie.create!(actor_id: actor3.id, movie_id: movie1.id)
