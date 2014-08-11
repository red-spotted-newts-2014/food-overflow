require 'rails_helper'


describe Question do
let!(:question) { FactoryGirl.create :question }
let!(:hashtag) { FactoryGirl.create :hashtag, question }
  
context 'associations' do
	it { should belong_to :user }
	it { should have_many :comments }
	it { should have_many :votes }
	it { should have_many :hashtag_questions }
	it { should have_many :hashtags }
end

context '#info' do
end

  
end
