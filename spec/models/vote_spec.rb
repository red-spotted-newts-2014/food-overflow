require 'rails_helper'

feature "Votes" do
  let!(:question) { FactoryGirl.create :question }
  let!(:vote1) { question.votes.create!(is_upvote?: true) }
  let!(:vote2) { question.votes.create!(is_upvote?: true) }
  let!(:vote3) { question.votes.create!(is_upvote?: false) }
  let!(:vote4) { question.votes.create!(is_upvote?: false) }

  it "#count_upvotes" do
    expect(Vote.count_upvotes).to eq(2)
  end

  it "#count_downvotes" do
    expect(Vote.count_downvotes).to eq(2)
  end

  it "#vote_difference" do
    expect(Vote.vote_difference).to eq(0)
  end
end
