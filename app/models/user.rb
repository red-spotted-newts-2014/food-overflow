class User < ActiveRecord::Base

	before_validation :check_password

	# MH: I'm pretty sure this is terrible
	def check_password
		unless self.access_token.nil?
			self.password = "gh-#{access_token}"
			self.password_confirmation = self.password
		end
		return self.password
	end

	has_secure_password

	has_many :questions
	has_many :comments, through: :questions
	# DO I NEED COMMENTABLE AS: WHEN USING THROUGH?

	# https://api.github.com/users/mhuerster?client_id=935c620d7555e425f1bf
	# https://developer.github.com/v3/users/
end
