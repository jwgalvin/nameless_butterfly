require 'rails_helper'

describe "Movie show page" do
  before (:each)  do
    @studio1 = Studio.create(name: "Joe's town", location: "here")
    @studio2 = Studio.create(name: "Mikes's town", location: "there")
    @movie1 = @studio1.movies.create!(title: "Joe's Onlyfans", creation_year: 1979, genre: "fiction")
    @movie2 = @studio2.movies.create!(title: "Another Antman", creation_year: 2027, genre: "non-ficiton")
    @actor1 = Actor.create!(name: "Joe Not Galvin", age: 25)
    @actor2 = Actor.create!(name: "Joe Galvin", age: 43)
    @actor3 = Actor.create!(name: "Not Galvin", age: 30)
    @actor4 = Actor.create!(name: "A Galvin", age: 65)
    @actor_mov1 = ActorMovie.create!(actor_id: @actor1.id, movie_id: @movie1.id)
    @actor_mov2 = ActorMovie.create!(actor_id: @actor2.id, movie_id: @movie1.id)
    @actor_mov3 = ActorMovie.create!(actor_id: @actor3.id, movie_id: @movie1.id)
  end

  it "has an show page w/name, and attributes. " do
   visit "/movie/#{@movie1.id}"

   expect(page).to have_content(@movie1.title)
   expect(page).to have_content(@movie1.creation_year)
   expect(page).to have_content(@movie1.genre)
   expect(page).to_not have_content(@movie2.title)
   expect(page).to_not have_content(@movie2.creation_year)
   expect(page).to_not have_content(@movie2.genre)
  end

  it "lists the actors from young to old, and the avg age" do
    visit "/movie/#{@movie1.id}"

    expect(@actor1.name).to appear_before(@actor3.name)
    expect(@actor3.name).to appear_before(@actor2.name)
  end

  it "has an add actor button" do
    visit "/movie/#{@movie1.id}"

    fill_in(:name "A Galvin")
    click_button("Search")
    expect(page).to have_content(@actor4.name)
    click_button("add #{actor4.name}")
    
  end
end
