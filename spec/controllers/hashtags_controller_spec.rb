require 'rails_helper'

describe HashtagsController do 
	let!(:hashtag) {FactoryGirl.create :hashtag }

		context "#index" do 
			it "provides the view with all hashtags" do
				get :index 
				expect(assigns(:hashtags)).to eq Hashtag.all.sort_by{|tag| tag.title}
			end
		end

		context "#show" do 
			it "shows one hashtag object" do 
				get :show, id: hashtag.id
				 expect(assigns(:hashtag)).to eq Hashtag.find hashtag.id
	    end
		end

		# context "#questions" do 
		# 	it "lists all questions tagged by a hashtag" do 
		# 		get :questions, id: hashtag.id
		# 		expect(assigns()).to eq Hashtag.find(hashtag.id).questions
		# 	end
		# end

	end