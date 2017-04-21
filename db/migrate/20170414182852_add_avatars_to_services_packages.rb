class AddAvatarsToServicesPackages < ActiveRecord::Migration
  def change
    add_column :services, :avatar, :string
    add_column :packages, :avatar, :string
  end
end
