class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :occasion_id
      t.integer :service_id
      t.integer :user_id
      t.string :name
      t.string :price
      t.string :block_dates

      t.timestamps null: false
    end
  end
end
