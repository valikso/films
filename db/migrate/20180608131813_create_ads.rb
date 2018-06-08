class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :title
      t.json :banner
      t.string :url
      t.string :description
      t.integer :view_count, default: 0
      t.timestamps
    end
  end
end
