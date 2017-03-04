class OccasionsController < ApplicationController
	before_action :find_occasion, only: [:show]

	def index
		@occasions = Occasion.all
	end

	def show
		@services = Occasion.services
	end

	private

	def find_occasion
		@occasion = Occasion.find(params[:id])
	end

	def occasion_params
		params.permit(:occasion).permit(:name, :guest_size)
	end
end
