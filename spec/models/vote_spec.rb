require 'rails_helper'

describe Vote do 
	describe "validations" do 
		describe "value validation" do 
			before do 
				@vote = Vote.new
			end
			it "allows 1 as value" do
				@vote.value = 1 
				expect(@vote.valid?).to eq(true)
			end
			it "allows -1 as value" do 
				@vote.value = -1
				expect(@vote.valid?).to eq(true)
			end
			it "does not allow 2 as value" do 
				@vote.value = 2
				expect(@vote.valid?).to eq(false)
			end
		end
	end
	
end
