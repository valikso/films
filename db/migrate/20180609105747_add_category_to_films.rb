class AddCategoryToFilms < ActiveRecord::Migration[5.1]
  def change
        add_reference :films, :films_category, foreign_key: true
  end
end
