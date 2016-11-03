require 'rails_helper'

describe Topic do

	include TestFactories
	
	describe "scopes" do 

		before do 
			@public_topic = Topic.create # default is public
			@private_topic = Topic.create(public: false)
		end 
	
		describe "publicly_viewable" do
			it "returns a relation of all public topics" do
				# byebug
         		expect(Topic.publicly_viewable).to eq( [@public_topic] )
			end 
		end  # publicly_viewable

		describe "privately_viewable" do
			it "returns a relation of all private topics" do 
				expect(Topic.privately_viewable).to eq( [@private_topic] )
			end
		end  # privately_viewable

		describe "visible_to(user)" do 
			it "return all topics if the user is present" do
				user = User.new # user is now not nil
				expect(Topic.visible_to(user).count).to eq(2) # 
				expect(Topic.visible_to(user)).to eq([@public_topic, @private_topic])
				expect(Topic.visible_to(user)).to eq(Topic.all)
			#	byebug
			end
			it "returns privately_viewable topics if user is nil (not signed)" do
				user = nil
				expect(Topic.visible_to(user).count).to eq(1) #
				expect(Topic.visible_to(user)).to eq(Topic.publicly_viewable)
			end
		end  # visible_to(user)

	end  # scopes
end  # Topic

