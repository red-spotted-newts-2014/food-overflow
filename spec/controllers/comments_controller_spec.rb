require 'rails_helper'

describe CommentsController do
	let!(:question) { FactoryGirl.create :question }

	context "#create" do
		it "should create a comment with valid parameters" do
			expect{
				post :create, question_id: question.id, comment: { content: "bacon ipsum dolor sit amet"}
			}.to change(question.comments, :count).by(1)
		end
		it "should not create a comment with invalid parameters" do
			expect{
				post :create, question_id: question.id, comment: { content: "" }
			}.not_to change(Comment, :count)
		end
	end
end