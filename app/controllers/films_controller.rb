class FilmsController < ApplicationController

  def show
    @film = Film.find_by_id(params[:id])
  end
  def index
  end
private

  def comment_params
    params.require(:comment).permit(:film, :message)
  end
end
