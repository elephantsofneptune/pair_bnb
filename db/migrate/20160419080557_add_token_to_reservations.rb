class AddTokenToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :token, :string
  end
end
