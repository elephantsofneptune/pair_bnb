class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.timestamps null: false
      t.integer :listing_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date
    end
  end
end

