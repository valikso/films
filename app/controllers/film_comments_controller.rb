class FilmCommentsController < ApplicationController
  def create
    @film = Film.find(params[:film_id])
    @comment = @film.film_comments.create(comment_params)
    redirect_to film_path(@film)
  end

  def destroy
    @comment = FilmComment.find(params[:id])
    @film = @comment.film
    if @comment.destroy
      redirect_to film_path(@film)
    end
  end

private
  def comment_params
    params.require(:film_comment).permit(:user_name, :message, :film)
  end
end
