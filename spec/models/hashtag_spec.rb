require 'rails_helper'

describe Hashtag do 
	context 'associations' do 
    it { should have_many :hashtag_questions }
    it { should have_many :questions }
	end

	context "validations" do 

		it "is valid with a title" do 

			tag = Hashtag.new(title: "fish")
			expect(tag).to be_valid
		end

		it "is invalid without a title" do 

			expect(Hashtag.new(title: nil)).to_not be_valid
		end

		it "is invalid with a duplicate title" do 
		
			Hashtag.create(title: "fish")
			tag = Hashtag.new(title: "fish")
			expect(tag).to_not be_valid
		end
	end

	context '#tagize' do
		let!(:hashtag) { Hashtag.new(title: 'My New Hashtag') }
		it 'is created with a title in any format' do
			expect(hashtag.title).to eq('My New Hashtag')
		end
		it 'reformats title before save' do
			hashtag.save
			expect(hashtag.title).to eq('my-new-hashtag')
		end
	end
end