class TextsController < ApplicationController
  def index
    @texts = Text.genre_select(params[:genre])
  end

  def show
    @text = Text.find_by(id: params[:id])
  end
end
