class Package < ActiveRecord::Base
	has_many :orders, dependent: :destroy	
	has_many :users, through: :orders

	belongs_to :user
	belongs_to :occasion
	belongs_to :service

	serialize :block_dates, Array
	serialize :avatar, Array

	# mount_uploader :avatar, AvatarUploader
end
