class MoviesController < ApplicationController
	before_action :signed_in_user

	def new
	end

	def index
		@movies = Movie.all
	end

	def create

	end

	def destroy
	end
end