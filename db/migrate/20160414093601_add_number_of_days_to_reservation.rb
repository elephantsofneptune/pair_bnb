class AddNumberOfDaysToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :stay, :integer
  end
end
