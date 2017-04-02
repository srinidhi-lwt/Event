class AddOrderDateToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :date_reserved, :date
  end
end
