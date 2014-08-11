require "rails_helper"

feature "Questions" do
  let!(:user) { FactoryGirl.create :user }

  context "#new" do
    it "is accessible from questions#index" do
      visit questions_path
      click_on "Ask your own!"
      expect(current_path).to eq new_question_path
    end

    it "successfully creates a question with valid params" do
      visit new_question_path
      fill_in "Title", with: "BACON!"
      fill_in "Content", with: "EXTRA CHUNKY PLZ"
      click_on "Save"
      expect(page).to have_content "BACON!"
    end
  end

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

  context "#edit" do
    let!(:question) { FactoryGirl.create :question }

    it "it accessible from questions#show" do
      visit question_path(question)
      click_on "Edit"
      expect(current_path).to eq edit_question_path(question)
    end

    it "redirects to homepage is update is successful" do
      visit edit_question_path(question)
      fill_in "Title", with: "Chunky Bacon"
      fill_in "Content", with: "Ham"
      click_on "Update Question"
      expect(current_path).to eq questions_path
      expect(page).to have_content("Chunky Bacon")
    end
  end
end
