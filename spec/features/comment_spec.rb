require 'rails_helper'

feature 'Comments' do
	let!(:user) { FactoryGirl.create :user }
	let!(:question) { FactoryGirl.create :question }

	context "question comments" do
		it "is accessible from questions#show" do
				visit question_url(question)
				expect(page).to have_selector('form')
		end
	end
end