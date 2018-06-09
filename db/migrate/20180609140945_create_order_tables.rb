class CreateOrderTables < ActiveRecord::Migration[5.1]
  def change
    create_table :order_tables do |t|
      t.string :user_name
      t.string :film_name
      t.integer :film_year
      t.string :comment

      t.timestamps
    end
  end
end
