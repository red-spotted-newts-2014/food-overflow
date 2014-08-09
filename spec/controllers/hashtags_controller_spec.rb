require 'rails_helper'

describe HashtagsController do 
	let!(:hashtag) {FactoryGirl.create :hashtag }

	it "#index" do 
		get :index 
		expect(assigns(:hashtags)).to eq Hashtag.all
	end

	it "#show" do 
		pending
		# get :show, id: :hashtag

	end

	end