class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      
      t.timestamps null: false
      t.integer :user_id
      t.string :description
      t.string :accomodates
      t.string :address
      t.string :city
      t.string :price
      t.string :photo_url

      t.boolean :smoking_room
      t.boolean :pet_friendly
      t.boolean :apartment
      t.boolean :house
      t.integer :housetype
    end
  end
end

