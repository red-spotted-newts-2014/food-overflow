require 'rails_helper'

describe UsersController, type: :controller do
  let!(:user) { FactoryGirl.create :user }

  context "#new" do
    it "assigns a new user" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end
  end

  context "#create" do
    it "creates a user" do
      expect{ post :create, user: { name: "Baconator", email: "bacon@bacon.com", password: "Bacon1234" }}
      .to change(User, :count).by(1)
    end
  end
end
