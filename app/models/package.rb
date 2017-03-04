class Package < ActiveRecord::Base
	belongs_to :user
	belongs_to :occasion
	belongs_to :service
end
