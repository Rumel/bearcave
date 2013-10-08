class AdminController < ApplicationController
	before_action :signed_in_admin
	REPLACEMENTS = ["480p", "480i", "720p", "720i", "1080p", "1080i"]

	def show
	end

	def upload
		uploaded_file = params[:file]
		@contents = uploaded_file.read.split("\n")
	end

	private

		# def treat_uploaded_file(text)
		# 	REPLACEMENTS.each do |r|
		# 		text.gsub! r, ""
		# 	end
		# 	return text
		# end
end
