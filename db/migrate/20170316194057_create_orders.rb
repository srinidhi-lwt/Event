class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

    	t.integer :package_id
    	t.integer :user_id
    	t.boolean :is_confirmed, default: false
      t.timestamps null: false
    end
  end
end
