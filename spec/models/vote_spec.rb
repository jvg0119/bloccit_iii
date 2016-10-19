require 'rails_helper'

describe Vote do 
	describe "validations" do 
		describe "value validation" do 
			it "allows 1 as value" do
				vote = Vote.new(value: 1)
				expect(vote.valid?).to eq(true)
			end
			it "allows -1 as value" do 
				vote = Vote.new(value: -1)
				expect(vote.valid?).to eq(true)
			end
			it "does not allow 2 as value" do 
				vote = Vote.new(value: 2)
				expect(vote.valid?).to eq(false)
			end
		end
	end
	
end
