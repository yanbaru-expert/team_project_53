class WatchProgressesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    current_user.watch_progresses.create!(movie_id: params[:movie_id])
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    current_user.watch_progresses.find_by(movie_id: params[:movie_id]).destroy!
  end
end
