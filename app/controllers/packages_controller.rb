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
		@package = current_user.packages.build(package_params)
		@package.user_id = current_user.id
		cloudinary_avatar_upload(@package) if params[:package][:avatar].present?
		@package.save
		redirect_to packages_path
	end

	def show
		@package = Package.find(params[:id])
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
		package_booking_date = params[:booking_date]
		order = Order.new(user_id: current_user.id, package_id: package.id, date_reserved: package_booking_date)
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

	def ratings
		order = Order.find(params[:rating][:order_id])
		package = order.package
		rating = package.ratings.build(ratings_params)
		rating.user_id = current_user.id
		if rating.save
			flash[:notice] = 'Review added successfully'
		else
			flash[:error] = 'Sorry couldn not add review'
		end
		redirect_to my_planner_path
	end
	
	private

	def ratings_params
		params.require(:rating).permit(:quality, :quantity, :time, :comment)
	end

	def package_params
		params.require(:package).permit(:name, :occasion_id, :service_id, :price, :user_id)
	end

	def cloudinary_avatar_upload(package)
		cloudinary_hash = Cloudinary::Uploader.upload(params[:package][:avatar])
		package.avatar << cloudinary_hash['public_id']
	end
end
