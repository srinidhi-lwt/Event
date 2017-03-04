class RemoveOccasionIdFromServices < ActiveRecord::Migration
  def change
  	remove_column :services, :occasion_id, :integer
  end
end
