require 'rails_helper'
feature "User browsing FoodOverflow" do

  context "view all questions" do
    let!(:user) { FactoryGirl.create :user }
    let!(:post) { FactoryGirl.create :post }

    it "sees a list of recent question titles" do
      visit root_path
      expect(page).to have_content("#{post.title}")
    end
  end
end
