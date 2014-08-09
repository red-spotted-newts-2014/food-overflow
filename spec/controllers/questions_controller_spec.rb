require 'rails_helper'

describe QuestionsController, type: :controller do
  let!(:question) { FactoryGirl.create :question }
  # let!(:user) { FactoryGirl.create :user }

  it "#new" do
    get :new
    expect(response).to be_success
  end

  context "#create" do
    it "should create a question with valid params" do
      expect{
        post :create, question: { title: "Steak", content: "over cooked" }
        }.to change(Question, :count).by(1)
    end

    it "should NOT create a question with invalid params" do
      expect{
        post :create, question: { title: "", content: "" }
      }.not_to change(Question, :count)
    end
  end

  it "#index" do
    get :index
    expect(assigns(:questions)).to eq Question.all
  end

  context "#show" do
    it "should have one question" do
      get :show, id: question.id
      expect(assigns(:question)).to eq Question.find question.id
    end
  end

  it "#edit" do
    get :edit, id: question.id
    expect(assigns(:question)).to eq Question.find question.id
  end

  context "#update" do
    xit "should update a question with valid params" do
      expect{ put :update, id: question.id, question: { title: "Chicken"}}
      .to change{ question.title }.from("Steak").to("Chicken")
    end
    xit "should NOT update a question with valid params" do
      expect{ put :update, id: question.id, question: { title: ""}}
      .not_to change{ question.title }.to("")
    end
  end

  context "#destroy" do
    xit "should delete a question" do
      expect{ delete :destroy, id: question.id}.to change(Question, :count).by(-1)
    end
  end
end
