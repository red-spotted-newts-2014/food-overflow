require "rails_helper"

feature "Questions" do
  let!(:user) { FactoryGirl.create :user }

  context "#index" do
    let!(:question) { FactoryGirl.create :question }

    it "contains questions" do
      visit questions_path
      expect(page).to have_content("All Questions")
      expect(page).to have_content(question.title)
    end
  end

  context "#show" do
    let!(:question) { FactoryGirl.create :question }

    it "it accessible from questions#index" do
      visit questions_path
      click_on question.title
      expect(current_path).to eq question_path(question)
    end

    it "should show the title and content of a question" do
      visit question_path(question)
      expect(page).to have_content(question.title)
      expect(page).to have_content(question.content)
    end
  end
end