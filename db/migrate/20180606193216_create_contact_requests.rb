class CreateContactRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_requests do |t|
      t.string :user_name
      t.string :email
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
