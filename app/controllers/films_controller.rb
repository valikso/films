class FilmsController < ApplicationController

  def show
    @film = Film.find_by_id(params[:id])
  end
  def index
    @films = Film.all
    @films = @films.where("title ILIKE :title",
              { title: "%#{params[:film_search]}%" }) if params[:film_search].present? && params[:film_search].length > 1
    # @category = FilmsCategory
    # @categories = @category.all.where("name ILIKE :name",
    #           { name: "%#{params[:films_category_search]}%" }) if params[:films_category_search].present?

  end
private

  def comment_params
    params.require(:comment).permit(:film, :message)
  end
end
