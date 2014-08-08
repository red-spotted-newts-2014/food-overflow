class Question < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
	has_many :hashtag_questions
	has_many :hashtags, through: :hashtag_questions
end
