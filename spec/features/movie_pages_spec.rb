require 'spec_helper'

describe "Movie pages" do
	subject { page }

	let(:admin) { FactoryGirl.create(:admin) }
	let(:user) { FactoryGirl.create(:user) }

	let(:movie_index_content) { "Movie Index" }

	before do
		admin.save
		user.save
	end

	describe "Admin user" do
		before do
			signin admin
			visit movies_path
		end

		it "should be able to access movies" do
			should have_content(movie_index_content)
		end
	end

	describe "Regular user" do
		before do
			signin user
			visit movies_path
		end

		it "should be able to access movies" do
			should have_content(movie_index_content)
		end
	end

	describe "Random people" do
		before { visit movies_path }

		it "should not be able to access movies" do
			should have_content("Sign in")
		end
	end
end