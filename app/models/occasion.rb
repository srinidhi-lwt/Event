class Occasion < ActiveRecord::Base
	has_many :packages
	has_many :services, through: :packages

	def self.services
		services = Service.all
	end
end
