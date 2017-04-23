class Occasion < ActiveRecord::Base
	has_many :packages
	has_many :services, through: :packages

	# mount_uploader :avatar, AvatarUploader
	
	serialize :avatar, Array

	def self.services
		services = Service.all
	end
end
