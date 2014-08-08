require 'rails_helper'

describe Question do
  context 'validations' do
    it { should belong_to :user }
    it { should have_many :comments }
    it { should have_many :votes }
    it { should have_many :hashtag_questions }
    it { should have_many :hashtags }
  end
end
