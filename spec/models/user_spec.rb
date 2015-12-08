require 'rails_helper'

describe User do

    include TestFactories
    
    
    describe "#favorited(post)" do
        before do
            @user = authenticated_user
            @post1 = associated_post
            @post2 = associated_post
            @favorite = Favorite.new(user: @user, post: @post2 )
            @favorite.save!
         end
        it "returns 'nil' if the user has not favorited the post" do
            expect(@user.favorited(@post1)).to eq(nil)
        end
        
        it "returns the appropriate favorite if it exists" do
            expect(@user.favorited(@post2)).to eq(@favorite)
        end
    end
end