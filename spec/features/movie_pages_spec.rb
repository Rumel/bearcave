require 'spec_helper'

describe "Movie pages" do
	subject { page }

	let(:admin) { FactoryGirl.create(:admin) }

	before do
		admin.save
	end

	describe "Only signed in users" do
		before do
			signin admin
			visit movies_path
		end

		it "should be able to access movies" do
			should have_content("Movie Index")
		end
	end

	describe "Random people" do
		before { visit movies_path }

		it "should not be able to access movies" do
			should have_content("Sign in")
		end
	end
end