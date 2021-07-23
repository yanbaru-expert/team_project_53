class MoviesController < ApplicationController
  def index
    @movies = Movie.genre_select(params[:genre])
  end
end
