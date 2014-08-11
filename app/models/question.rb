class Question < ActiveRecord::Base
	belongs_to :user
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
	has_many :hashtag_questions
	has_many :hashtags, through: :hashtag_questions

	validates_length_of :title, minimum: 1
	validates_length_of :content, minimum: 1


	def info
		spec = {}
		spec[:tags] = hashtags.sort_by{|tag| tag.title} unless hashtags.empty?
		if votes.any?
			spec[:total_votes] = votes.count_difference
		else
			spec[:total_votes] = 0
		end
		spec[:answers] =  comments.sort_by do |comment| 
												comment.votes.count_difference
											end
		spec  
	end 
end
