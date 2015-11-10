require 'faker'

#create users
5.times do
    user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10)
        )
    user.skip_confirmation!
    user.save!
end

users = User.all

 # Note: by calling `User.new` instead of `create`,
 # we create an instance of User which isn't immediately saved to the database.
 
 # The `skip_confirmation!` method sets the `confirmed_at` attribute
 # to avoid triggering an confirmation email when the User is saved.
 
 # The `save` method then saves this User to the database.

#create posts
50.times do
    Post.create!(
        user: users.sample,
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph
    )
end
posts = Post.all

#create comments
100.times do
    Comment.create!(
        #user: users.sample, #we haven't associated users with comments yet
        post: posts.sample,
        body: Faker::Lorem.paragraph
    )
end

admin = User.new(
    name: 'Admin User',
    email: 'admin@example.com',
    password: 'helloworld',
    role: 'admin'
    )
admin.skip_confirmation!
admin.save!

moderator = User.new(
    name: "Moderator User",
    email: "moderator@example.com",
    password: "helloworld",
    role: 'moderator')
moderator.skip_confirmation!
moderator.save!

member= User.new(
    name: 'Member User',
    email: 'member@exampe.com',
    password: 'helloworld'
    )
member.skip_confirmation!
member.save!

post1 = Post.create!(
    user: member,
    title: "Member Post",
    body: "Body of Member Post"
    )


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"



    
