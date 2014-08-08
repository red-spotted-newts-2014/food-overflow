require 'rails_helper'

describe Hashtag do 
	context 'validations' do 
    it { should have_many :hashtag_questions }
    it { should have_many :questions }
	end

end