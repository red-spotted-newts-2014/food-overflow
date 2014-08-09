class Question < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
	has_many :hashtag_questions
	has_many :hashtags, through: :hashtag_questions

	validates_length_of :title, minimum: 1
	validates_length_of :content, minimum: 1
end
