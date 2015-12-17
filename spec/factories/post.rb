FactoryGirl.define do
    factory :post do
        title "Post Title"
        body "Post bodies must be pretty long"
        user
        topic { Topic.create!(name: 'Topic Name', description: 'Topic Description') }
    end
end
