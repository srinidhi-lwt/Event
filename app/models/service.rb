class Service < ActiveRecord::Base
	has_many :packages
	has_many :occasions, through: :packages
end
