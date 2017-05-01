class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.string :rating
    	t.string :comment
    	t.integer :package_id
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
