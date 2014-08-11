require 'rails_helper'

describe UsersController, type: :controller do
  context "#create" do
    let!(:user) { FactoryGirl.create :user }

    it "creates a user" do
      expect{ post :create, user: { name: "Baconator", email: "bacon@bacon.com", password: "Bacon1234" }}
      .to change(User, :count).by(1)
    end
  end
end
