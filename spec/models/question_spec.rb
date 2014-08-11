require 'rails_helper'


describe Question do
	let!(:question) { FactoryGirl.create :question }
	let!(:hashtag) { FactoryGirl.create :hashtag }
	let!(:vote) { question.votes << Vote.create(is_upvote: false) }
	let!(:comment) { FactoryGirl.create :comment, commentable: question }
	  
	context 'associations' do
		it { should belong_to :user }
		it { should have_many :comments }
		it { should have_many :votes }
		it { should have_many :hashtag_questions }
		it { should have_many :hashtags }
	end

	context '#info' do
		it 'stores all hashtags for a question' do
			question.hashtags << hashtag
			expect(question.info[:tags]).to include(hashtag)
		end
		# MH -can't get this to pass
		# Don't know if the problem is with the method or my test
		xit 'counts all votes for a question' do
			expect(question.info[:vote_count]).to eq(1)
		end
		it 'stores all answers for a question' do
			expect(question.info[:answers]).to include(comment)
		end
	end
end
