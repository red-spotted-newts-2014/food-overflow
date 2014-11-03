class User < ActiveRecord::Base
  has_many :questions
  has_many :comments, through: :questions
  has_many :votes

  before_validation :check_password

  def check_password
    unless self.access_token.nil?
      self.password = "gh-#{access_token}"
      self.password_confirmation = self.password
     end
     return self.password
  end

  has_secure_password
end
