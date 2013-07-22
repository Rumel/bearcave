require 'spec_helper'

describe "Authentication" do
	subject { page }

	# You have to have a user before you ever see the
	# sigin page
	let(:user) { FactoryGirl.create(:user) }
	before do
		user.save
	end

	describe "Signin page" do
		before { visit signin_path }

		let(:submit) { "Sign in" }
		let(:signout) { "Sign out" }

		it { should have_content('Sign in') }

		describe "with invalid information" do
			before { click_button submit }

			it { should_not have_content("Sign out") }
			it { should have_content("Sign in") }
		end

		describe "with valid information" do
			before do
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password
				click_button submit
			end

			it { should have_content("Sign out") }
		end
	end

	describe "Signing out" do
		before do
			signin user
		end

		describe "should sign the user out" do
			before { click_link "Sign out" }

			it { should have_content(:submit)}
		end
	end
end