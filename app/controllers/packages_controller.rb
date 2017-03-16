class PackagesController < ApplicationController

	def index
		if params[:service].nil?
			@packages = Package.all
		else
			service_id = Service.where(name: params[:service]).first.id
			occasion_id = Occasion.where(name: params[:occasion]).first.id
			@packages = Package.where(service_id: service_id, occasion_id: occasion_id)
		end
	end

	def show
	end

	def select_date_for_package
		package = Package.find(params[:package])
		@package_blocked_dates = package.block_dates.map { |date| date.to_datetime }
	end

	def planner
		@package = Package.find(params[:package])
	end
end
