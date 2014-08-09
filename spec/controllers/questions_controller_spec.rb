require 'rails_helper'

describe QuestionsController do
  let!(:question) { FactoryGirl.create :question }

  it "#new" do
    get :new
    expect(response).to be_success
  end

  context "#create" do
    it "should create a question with valid params" do
      expect{ question :create, question: { title: "Steak", content: "over cooked" }}
      .to change(Question, :count).by(1)
    end

    it "should NOT create a question with valid params" do
      expect{ question :create, question: { title: "", content: "" }}
      .to change(Question, :count).by(0)
    end
  end

  it "#index" do
    get :index
    expect(assigns(:questions)).to eq Question.all
  end

  context "#show" do
    it "should have one question" do
      get :show
      expect(assigns(:question)).to eq Question.find question.id
    end
  end

  it "#edit" do
    get :edit
    expect(assigns(:question)).to eq Question.find question.id
  end

  context "#update" do
    xit "should update a question with valid params" do
      get :update
      expect{ put :update, id: question.id, question: { title: "Chicken"}}
      .to change{ question.title }.from("Steak").to("Chicken")
    end
    xit "should NOT update a question with valid params" do
      get :update

    end
  end

  context "#destroy" do
    xit "should delete a question" do

    end
  end
end
