class ReadProgressesController < ApplicationController
  def create
    @text = Text.find(params[:text_id])
    current_user.read_progresses.create!(text_id: params[:text_id])
  end

  def destroy
    @text = Text.find(params[:text_id])
    current_user.read_progresses.find_by(text_id: params[:text_id]).destroy!
  end
end
