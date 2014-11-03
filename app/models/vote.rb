class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: :true
  belongs_to :user

  validates :user, :votable_type, :votable_id, presence: true

  scope :count_upvotes, -> { where(is_upvote: true).count }
  scope :count_downvotes, -> { where(is_upvote: false).count }

  def self.count_difference
    self.count_upvotes - self.count_downvotes
  end
end
