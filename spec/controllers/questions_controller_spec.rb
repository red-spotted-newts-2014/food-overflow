require 'rails_helper'

describe QuestionsController, type: :controller do
  let!(:question) { FactoryGirl.create :question }
  let!(:user) { FactoryGirl.create :user }

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

    it "should generate a flash notice on successful creation" do
      post :create, question: { title: "Steak", content: "Tartare" }
      expect(flash[:notice]).to eq("Your question has been posted.")
    end

    it "should NOT create a question with invalid params" do
      expect{
        post :create, question: { title: "", content: "" }
      }.not_to change(Question, :count)
    end

    it "should generate a flash notice on unsuccessful creation" do
      post :create, question: { title: "", content: "" }
      expect(flash[:notice]).to eq("Something was wrong. Please try again.")
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
    it "should update a question with valid params" do
      @original_title = question.title
      expect{
        put :update, id: question.id, question: { title: "Chicken" }
        question.reload
      }.to change{ question.title }.from(@original_title).to("Chicken")
    end
    it "should NOT update a question with invalid params" do
      expect{
        put :update, id: question.id, question: { title: ""}
        question.reload
        }.not_to change{ question.title }
    end
  end

  context "#destroy" do
    it "should delete a question" do
      expect{
        delete :destroy, id: question.id
        }.to change(Question, :count).by(-1)
    end
  end
end
