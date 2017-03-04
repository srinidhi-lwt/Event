class PackagesController < ApplicationController

	def index
		service_id = Service.where(name: params[:service]).first.id
		occasion_id = Occasion.where(name: params[:occasion]).first.id
		@packages = Package.where(service_id: service_id, occasion_id: occasion_id)
	end

	def show
	end
end
