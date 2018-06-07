class CreateFilms < ActiveRecord::Migration[5.1]
  def change
    create_table :films do |t|
      t.string :title
      t.string :year
      t.string :author
      t.string :descrintion
      t.json :logo

      t.timestamps
    end
  end
end
