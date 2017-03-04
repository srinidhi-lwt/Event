class PackagesController < ApplicationController
	before_action :find_package, only: [:show]

	def index
	end

	def show
	end

	private

	def find_package
		@package = Package.find(params[:id])
	end
end
