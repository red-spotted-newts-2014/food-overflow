require 'rails_helper'

describe QuestionsController do
  let!(:question) { FactoryGirl.create :question }

  context "#new" do

  end

  context "#create" do
    xit "should" do

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

  context "#edit" do
    xit "should" do

    end
  end

  context "#update" do
    xit "should" do

    end
  end

  context "#destroy" do
    xit "should delete a question" do

    end
  end
end
