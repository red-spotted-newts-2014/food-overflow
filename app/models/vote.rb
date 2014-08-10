class Vote < ActiveRecord::Base
	belongs_to :votable, polymorphic: :true

	scope :count_upvotes, -> { where(is_upvote?: true).count }
	scope :count_downvotes, -> { where(is_upvote?: false).count }

	def self.count_difference
		self.count_upvotes - self.count_downvotes
	end
end
