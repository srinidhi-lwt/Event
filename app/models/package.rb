class Package < ActiveRecord::Base
	has_many :orders, dependent: :destroy	
	has_many :users, through: :orders
	has_many :ratings, dependent: :destroy

	belongs_to :user
	belongs_to :occasion
	belongs_to :service

	serialize :block_dates, Array
	serialize :avatar, Array
end
