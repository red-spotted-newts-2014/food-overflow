class Hashtag < ActiveRecord::Base
	validates :title, uniqueness: true 
	validates :title, presence: true 

	has_many :hashtag_questions
	has_many :questions, through: :hashtag_questions

	#before_save :tagize


	private 
	def tagize
		title.downcase!.gsub!(" ", "-")
	end 
end
