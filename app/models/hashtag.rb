class Hashtag < ActiveRecord::Base
	has_many :hashtag_questions
	has_many :questions, through: :hashtag_questions

	validates :title, uniqueness: true
	validates :title, presence: true
	
	before_validation :tagize


	private
	def tagize
		self.title = self.title.downcase.gsub(" ", "-") if self.title
	end
end
