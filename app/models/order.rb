class Order < ActiveRecord::Base
	belongs_to :package
	belongs_to :user

	validates_uniqueness_of :package_id, scope: [:user_id ]
end
