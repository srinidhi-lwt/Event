class Package < ActiveRecord::Base
	has_many :orders
	has_many :users, through: :orders

	belongs_to :user
	belongs_to :occasion
	belongs_to :service

	serialize :block_dates, Array
end
