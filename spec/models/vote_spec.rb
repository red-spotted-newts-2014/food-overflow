require 'rails_helper'

feature "Votes" do

  let!(:question) { FactoryGirl.create :question }

  it "#count_upvotes" do
    expect{
        question.votes << Vote.create(is_upvote: true)
      }.to change(Vote, :count_upvotes).by(1)
  end

  it "#count_downvotes" do
    expect{ 
        question.votes << Vote.create(is_upvote: false)
    }.to change(Vote, :count_downvotes).by(1)
  end

  it "#count_difference" do
    expect{ 
        question.votes << Vote.create(is_upvote: false)
    }.to change(Vote, :count_difference).by(-1)
  end
end
