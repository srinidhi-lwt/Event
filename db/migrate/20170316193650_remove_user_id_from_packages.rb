class RemoveUserIdFromPackages < ActiveRecord::Migration
  def change
  	remove_column :packages, :user_id, :integer
  end
end
