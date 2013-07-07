require 'spec_helper'

describe "User pages" do
	subject { page }

	describe "Sign up page" do
		before { visit signup_path }

		it { should have_content('Bearcave') }
		it { should have_button('Create!') }
	end

	describe "Creating an account" do
		before { visit signup_path }

		let(:submit) { "Create!"}

		describe "with invalid information" do
			it "should not create the user account" do
				expect { click_button "Create!"}.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Example User"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "password"
				fill_in "Confirm Password", with: "password"
			end

			it "should create the user" do
				expect { click_button "Create!" }.to change(User, :count).by(1)
			end
		end
	end
end