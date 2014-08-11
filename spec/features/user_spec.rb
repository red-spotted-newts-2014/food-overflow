require 'rails_helper'
feature "User browsing FoodOverflow" do

  context "view all questions" do
    let!(:user) { FactoryGirl.create :user }
    let!(:question) { FactoryGirl.create :question }

    it "sees a list of recent question titles" do
      visit root_path
      expect(page).to have_content("#{question.title}")
    end

    it "can click on a question title and see the question page" do
      visit root_path
      click_link("#{question.title}")
      expect(current_path). to eq(question_path id: question.id)
    end
  end

  context "can view a single question" do
  end

  it "can create a new user" do
    visit new_user_path
    fill_in "Name", with: "HALLO"
    fill_in "Email", with: "more_kabob@armo4lyfe.com"
    fill_in "Password", with: "noturks1234"
    click_on "Create User"
    expect(current_path).to eq(root_path)
  end
end
