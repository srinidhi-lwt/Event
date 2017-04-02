class DealersController < ApplicationController
	before_action :authenticate_user!
	before_action :is_dealer?

	def dashboard
		@packages = current_user.packages
	end

	def block_date_for_package
		@packages = current_user.packages
	end

	def block_date
		@package = Package.find(params[:package])
	end

	def update_block_date
		package = Package.find(params[:package])
		block_dates = params[:block_date].split(',')
		block_dates.each { |date| package.block_dates << date }
		package.block_dates.uniq!
		if package.save
			flash[:success] = 'The dates have been succesfully blocked'
			redirect_to my_packages_path
		else
			flash[:alert] = 'The dates were unable to block'
			redirect_to dashboard_path
		end
	end

	def my_packages
		@packages = current_user.packages
	end

	private

	def is_dealer?
		unless current_user.is_dealer?
			flash[:alert] = 'You are unauthorized to be a Dealer'
			redirect_to root_path
		end
	end
end
