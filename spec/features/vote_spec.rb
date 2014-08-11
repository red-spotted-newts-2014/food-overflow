require 'rails_helper'

describe "vote box" do
  context "upvote" do
    it "comes back to the votes path" do
      visit votes_path
      click_on "upvote"
      expect(current_path).to eq(votes_path)
    end

    it "creates an upvote" do
      visit votes_path
      expect{
        click_on "upvote"
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
