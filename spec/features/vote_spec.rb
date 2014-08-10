require 'rails_helper'

describe "vote box" do
  it "creates an upvote" do
    click_on "upvote"
    expect(current_path).to eq(votes_path)
  end
end
