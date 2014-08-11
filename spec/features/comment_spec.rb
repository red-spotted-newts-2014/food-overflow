require 'rails_helper'

feature 'Comments' do
	let!(:user) { FactoryGirl.create :user }
	let!(:question) { FactoryGirl.create :question }
	let!(:comment) { FactoryGirl.create :comment, commentable: question }

	context "question comments" do
		
		before(:each) do
			visit question_url(question)
		end

		it "is accessible from questions#show" do
				expect(page).to have_selector('form#new_comment')
		end

		it 'successfully creates a comment with valid params' do
			within ('form#new_comment') do
				fill_in('Content', with: 'Lorem bacon dolor sit amet etc.')
			end
			click_button 'Create Comment'
			expect(page).to have_content('Lorem bacon dolor sit amet etc.')
		end

		it "redirects to index instead of creating a comment with invalid params" do
			within ('form#new_comment') do
				fill_in('Content', with: '')
			end
			click_button 'Create Comment'
			expect(current_path).to eq(root_path)
		end
	end

	context "comment comments" do

		before (:each) do
			visit comment_url(comment)
		end
		it "is accessible from comments#show" do
			expect(current_url).to eq(comment_url(comment))
			expect(page).to have_selector('form')
		end

		it 'successfully creates a comment with valid params' do
			within ('form') do
				fill_in('Content', with: 'very lonely vegan')
			end
			click_button 'Create Comment'
			expect(page).to have_content('very lonely vegan')
		end
		it 'redirects to the original question page' do
			within ('form') do
				fill_in('Content', with: 'very lonely vegan')
			end
			click_button 'Create Comment'
			expect(current_path).to eq(question_path(question))
		end
		it 'does not create a comment with invalid params' do
			within ('form') { fill_in('Content', with: '') }
			click_button 'Create Comment'
			expect(page).to have_content('Something was wrong. Please try again.')
		end
	end
end