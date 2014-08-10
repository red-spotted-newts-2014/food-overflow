require 'rails_helper'

describe User do

	context 'associations' do
		it { should have_many :questions }
		it { should have_many :comments }
	end

	context 'validations' do
		let!(:user) { User.new(name: "first last", email: "first.last@gmail.com", access_token: "test-token") }
		it "initially has no password if created via oauth" do
			expect(user.password).to be_nil
		end
		it "creates a dummy password for a user created via oauth" do
			user.save
			expect(user.password).to eq("gh-test-token")
		end
	end
end