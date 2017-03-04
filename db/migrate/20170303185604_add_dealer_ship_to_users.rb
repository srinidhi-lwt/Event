class AddDealerShipToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_dealer, :boolean, default: false
  end
end
