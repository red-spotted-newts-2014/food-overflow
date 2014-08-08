require 'rails_helper'

describe QuestionsController do
  let!(:question) { FactoryGirl.create :question }

  it "#index" do
    get :index
    expect(assigns(:questions)).to eq Question.all
  end
end
