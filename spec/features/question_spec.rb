require "rails_helper"

feature "Questions" do
  let!(:user) { FactoryGirl.create :user }

  context "#index" do
    let!(:question) { FactoryGirl.create :question }
    it "contains posts" do
      visit questions_path
      expect(page).to have_content("All Questions")
      expect(page).to have_content(question.title)
    end

    it "can click a link to the question#show" do
      visit questions_path
      click_on question.title
      expect(page).to have_content("yoyo") # will need to adjust to show view
    end
  end
end
