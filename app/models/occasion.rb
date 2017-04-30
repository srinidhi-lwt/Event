class Occasion < ActiveRecord::Base
	has_many :packages, dependent: :destroy	
	has_many :services, through: :packages
	
	serialize :avatar, Array

	def self.services
		services = Service.all
	end
end
