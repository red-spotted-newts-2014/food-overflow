require 'rails_helper'

describe "vote box" do

  let!(:question) { FactoryGirl.create :question }

  context "upvote" do
    it "comes back to the votes path" do
      visit question_url(question)
      click_on "upvote"
      expect(current_path).to eq(votes_path)
    end

    it "creates an upvote" do
      visit question_url(question)
      expect{
        find(:css, "div.voter.up").click
        question.reload
      }.to change(Vote, :count_upvotes).by(1)
    end
  end

  context "downvote" do
    it "comes back to the votes path" do
      visit votes_path
      click_on "downvote"
      expect(current_path).to eq(votes_path)
    end

    it "creates a downvote" do
      visit votes_path
      expect{click_on "downvote"}.to change(Vote, :count_downvotes).by(1)
    end
  end
end
