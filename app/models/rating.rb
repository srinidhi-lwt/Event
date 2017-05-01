class Rating < ActiveRecord::Base
	belongs_to :package
	belongs_to :user
end
