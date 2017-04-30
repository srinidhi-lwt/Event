class Service < ActiveRecord::Base
	has_many :packages, dependent: :destroy	
	has_many :occasions, through: :packages

	serialize :avatar, Array
end
