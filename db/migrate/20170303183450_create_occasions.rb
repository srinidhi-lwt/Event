class CreateOccasions < ActiveRecord::Migration
  def change
    create_table :occasions do |t|
      t.string :name
      t.string :guest_size

      t.timestamps null: false
    end
  end
end
