class AddAvatarToOccassions < ActiveRecord::Migration
  def change
    add_column :occasions, :avatar, :string
  end
end
