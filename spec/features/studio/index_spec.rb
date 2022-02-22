require 'rails_helper'

describe "Studio index page" do
  before (:each)  do
    @studio1 = Studio.create(name: "Joe's town", location: "here")
    @studio2 = Studio.create(name: "Mikes's town", location: "there")
    @movie1 = @studio1.movies.create!(title: "Joe's Onlyfans", creation_year: 1979, genre: "fiction")
    @movie2 = @studio2.movies.create!(title: "Another Antman", creation_year: 2027, genre: "non-ficiton")
  end

  it "has an index page w/name, loc and movies. " do
   visit "/studio"

   expect(page).to have_content(@studio1.name)
   expect(page).to have_content(@studio2.name)
   expect(page).to have_content(@studio1.location)
   expect(page).to have_content(@studio2.location)
  end

  it "also lists all the movies for each studio" do
    visit "/studio"

    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie2.title)
  end
end
