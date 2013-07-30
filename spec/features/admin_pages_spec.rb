require 'spec_helper'

describe "Admin page" do
	subject { page }

	let(:admin) { FactoryGirl.create(:admin) }
	let(:user) { FactoryGirl.create(:user) }

	before do
		admin.save
		user.save
	end

	describe "Admin User" do
		before do
			signin admin
			visit admin_path
		end

		it "should see admin page" do
			should have_content("Admin Page")
		end
	end

	describe "Regular user" do
		before { signin user }

		it "should raise an error" do
			lambda { visit admin_path }.should 
			raise_error(ActionController::RoutingError)
		end
	end
end