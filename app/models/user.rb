class User < ActiveRecord::Base
	has_secure_password
	
	has_many :questions
	has_many :comments, through: :questions
	# DO I NEED COMMENTABLE AS: WHEN USING THROUGH?
end
