class DealersController < ApplicationController

	def dashboard
		@packages = current_user.packages
	end
end
