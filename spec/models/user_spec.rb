require 'rails_helper'

describe User do

    include TestFactories
    
    
    describe "#favorited(post)" do
        before do
            @user = authenticated_user
            @post1 = associated_post
            @post2 = associated_post
            @favorite = Favorite.new(user: @user, post: @post2 )
         end
        it "returns 'nil' if the user has not favorited the post" do
            expect( favorited(@post1).to be_false)
        end
        
        it "returns the appropriate favorite if it exists" do
            expect( favorited(@post2).to be_true)
        end
    end
end