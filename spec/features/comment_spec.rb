require 'rails_helper'

feature 'Comments' do
	let!(:user) { FactoryGirl.create :user }
	let!(:question) { FactoryGirl.create :question }

	context "question comments" do
		it "is accessible from questions#show" do
				visit question_url(question)
				expect(page).to have_selector('form')
		end

		it 'successfully creates a comment with valid params' do
			visit question_url(question)
			within ('form') do
				fill_in('Content', with: 'Lorem bacon dolor sit amet etc.')
			end
			click_button 'Create Comment'
			expect(page).to have_content('Lorem bacon dolor sit amet etc.')
		end

		it "redirects to index instead of creating a comment with invalid params" do
			visit question_url(question)
			within ('form') do
				fill_in('Content', with: '')
			end
			click_button 'Create Comment'
			expect(current_path).to eq(root_path)
		end
	end
end