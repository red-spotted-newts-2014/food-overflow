require 'rails_helper'

describe CommentsController do
	let!(:user) { FactoryGirl.create :user }
	let!(:question) { FactoryGirl.create :question }
	let!(:comment) { FactoryGirl.create :comment, commentable: question }

	context "comments on questions" do
		it "creates a comment with valid parameters" do
			expect{
				post :create, question_id: question.id, comment: { content: "bacon ipsum dolor sit amet" }
			}.to change(question.comments, :count).by(1)
		end
		it "does not create a comment with invalid parameters" do
			expect{
				post :create, question_id: question.id, comment: { content: "" }
			}.not_to change(Comment, :count)
		end
	end

	context "comments on comments" do
		it "creates a comment with valid parameters" do
			expect{
				post :create, comment_id: comment.id, comment: { content: "bacon ipsum dolor sit amet" }
			}.to change(comment.comments, :count).by(1)
		end
		it "does not create a comment with invalid parameters" do
			expect{
				post :create, comment_id: comment.id, comment: { content: "" }
			}.not_to change(Comment, :count)
		end
	end
end