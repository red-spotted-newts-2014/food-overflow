class Vote < ActiveRecord::Base
	belongs_to :votable, polymorphic: :true

	scope :count_upvotes, -> { where(is_upvote?: true).count }
	scope :count_downvotes, -> { where(is_upvote?: false).count }
end
