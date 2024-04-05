class CreateCheckouts < ActiveRecord::Migration[7.1]
  def change
    create_table :checkouts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.boolean :news_subscription
      t.string :delivery_type
      t.string :address
      t.string :city
      t.string :house
      t.string :postal_code
      t.string :zip
      t.boolean :save_address
      t.text :message

      t.timestamps
    end
  end
end
