require 'rails_helper'

describe "vote box" do
  context "upvote" do
    it "comes back to the votes path" do
      click_on "upvote"
      expect(current_path).to eq(votes_path)
    end

    it "creates an upvote" do
      expect{click_on "upvote"}.to change(Vote.count_upvotes).by(1)
    end
  end
end
