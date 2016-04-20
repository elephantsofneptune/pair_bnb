class AddTotalamountToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :total_amount, :integer
  end
end
