class AddViewsCountToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :films_page_view_count, :integer, default: 0
  end
end
