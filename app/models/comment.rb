class Comment < ActiveRecord::Base
  has_many :comments, as: :commentable
  belongs_to :commentable, polymorphic: :true
  has_many :votes, as: :votable
  validates_length_of :content, minimum: 1
end
