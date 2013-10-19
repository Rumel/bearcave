class AdminController < ApplicationController
	before_action :signed_in_admin
	REPLACEMENTS = ["480p", "480i", "720p", "720i", "1080p", "1080i"]

	def show
	end

	def upload
		uploaded_file = params[:file]
		@contents = uploaded_file.read.split("\n")
		@fetched = []
		@contents.each do |c|
			if(Movie.find_by(imported_name: c) == nil)
				search = Tmdb::Search.new
				search.resource("movie")
				search.query(c)
				found = search.fetch.first
				@fetched << found
				save_movie(c, found)
			end
		end
	end

	def delete_all_movies
		Movie.delete_all
	end

	private

		def save_movie(query, m)
			result = Tmdb::Movie.detail(m["id"])
			movie = Movie.new
			movie.imported_name = query
			movie.name = result.title
			movie.content = result.overview
			#Fix this
			movie.year = 2000
			movie.adult = result.adult
			movie.backdrop_path = result.backdrop_path
			movie.imdb_id = result.imdb_id
			movie.poster_path = result.poster_path
			movie.runtime = result.runtime
			movie.tagline = result.tagline
			movie.tmdb_id = result.id
			movie.save
		end
end
