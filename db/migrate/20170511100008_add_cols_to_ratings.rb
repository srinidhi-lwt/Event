class AddColsToRatings < ActiveRecord::Migration
  def change
  	add_column :ratings, :quality, :string
  	add_column :ratings, :quantity, :string
  	add_column :ratings, :time, :string
  	add_column :ratings, :overall, :string
  	remove_column :ratings, :rating, :string
  end
end
