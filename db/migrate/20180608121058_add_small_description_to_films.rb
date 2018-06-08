class AddSmallDescriptionToFilms < ActiveRecord::Migration[5.1]
  def change
    add_column :films, :small_description, :string
  end
end
