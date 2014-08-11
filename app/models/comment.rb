class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: :true
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
	
	validates_length_of :content, minimum: 1
end
