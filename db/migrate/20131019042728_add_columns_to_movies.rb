class AddColumnsToMovies < ActiveRecord::Migration
  def change
  	add_column :movies, :adult, :boolean
  	add_column :movies, :backdrop_path, :string
	add_column :movies, :imdb_id, :string
	add_column :movies, :poster_path, :string
	add_column :movies, :runtime, :integer
	add_column :movies, :release_date, :date
	add_column :movies, :tagline, :string
  	add_column :movies, :tmdb_id, :integer
  end
end