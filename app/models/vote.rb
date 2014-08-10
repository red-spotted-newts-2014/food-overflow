class Vote < ActiveRecord::Base
	belongs_to :votable, polymorphic: :true

	def self.count_upvotes
		
	end
end
