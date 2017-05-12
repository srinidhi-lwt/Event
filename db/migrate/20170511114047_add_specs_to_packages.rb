class AddSpecsToPackages < ActiveRecord::Migration
  def change
  	add_column :packages, :minimum_number, :string
  	add_column :packages, :maximum_number, :string
  	add_column :packages, :description, :text
  	add_column :packages, :specs_1, :string
  	add_column :packages, :specs_2, :string
  	add_column :packages, :specs_3, :string
  	add_column :packages, :specs_4, :string
  	add_column :packages, :specs_5, :string
  	add_column :packages, :specs_6, :string
  	add_column :packages, :specs_7, :string
  	add_column :packages, :specs_8, :string
    add_column :packages, :eme_guarantee, :boolean, default: false
  end
end
