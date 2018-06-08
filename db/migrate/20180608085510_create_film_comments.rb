class CreateFilmComments < ActiveRecord::Migration[5.1]
  def change
    create_table :film_comments do |t|
      t.references :film
      t.string :user_name
      t.string :message

      t.timestamps
    end
  end
end
