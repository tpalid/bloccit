require 'faker'

#create posts
50.times do
    Post.create!(
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph
    )
end
posts = Post.all

#create comments
100.times do
    Comment.create!(
        post: posts.sample,
        body: Faker::Lorem.paragraph
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

new_post = Post.create!(
    title: "New Post, Assignment 32",
    body: "This is a new post added in Assignment 32"
    )

new_comment = Comment.create!(
    post: new_post,
    body: "Comment on new post, Assignment 32")