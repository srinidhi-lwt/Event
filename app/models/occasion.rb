class Occasion < ActiveRecord::Base
	has_many :packages
	has_many :services, through: :packages

	mount_uploader :avatar, AvatarUploader

	def self.services
		services = Service.all
	end
end
