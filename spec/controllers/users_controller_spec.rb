require 'rails_helper'

describe UsersController, type: :controller do
  context "#create" do
    let!(:user) { FactoryGirl.create :user }

    it "creates a user" do
      expect{ post :create, user: { user }}
      .to change(User, :count).by(1)
    end
  end
end
