class MovieController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.cast
    if params[:name].present?
      #binding.pry
      @actorz = Actor.where(params[:name])
      binding.pry
    end
  end

  def add_cast
  cast = Movie.find(params[:id])
  actor = Actor.find(params[:actor])
  cast.add_actor(actor)
  redirect_to "/movie/#{@movie1.id}"
 end

end
