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

	def new
		@package = Package.new
	end

	def create
		@package = Package.new(package_params)
		Cloudinary::Uploader.upload(params[:package][:avatar])
		@package.save
		redirect_to packages_path
	end

	def show
	end

	def select_date_for_package
		package = Package.find(params[:package])
		@package_blocked_dates = package.block_dates.map { |date| date.to_datetime }
	end

	def add_to_planner
		@package = Package.find(params[:package])
	end

	def place_order
		package = Package.find(params[:package])
		order = Order.new(user_id: current_user.id, package_id: package.id)
		if order.save
			flash[:success] = 'The order for this package has been successfully placed'
			redirect_to my_planner_path
		else
			flash[:alert] = 'This Package has been already taken by you'
			redirect_to packages_path
		end
	end

	def my_planner
		@orders = Order.where(user_id: current_user.id)
	end
	
	private

	def package_params
		params.require(:package).permit(:name, :occasion_id, :service_id, :price, :avatar)
	end
end
