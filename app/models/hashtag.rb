class Hashtag < ActiveRecord::Base
	validates :title, uniqueness: true 

	has_many :hashtag_questions
	has_many :questions, through: :hashtag_questions

end
