class Package < ActiveRecord::Base
	belongs_to :user
	belongs_to :occasion
	belongs_to :service

	serialize :block_dates, Array
end
