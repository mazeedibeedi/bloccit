require 'random_data'

# Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
posts = Post.all

# Create Comments

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
Post.find_or_create_by!(
  title: "This is a unique title",
  body: "This is a unique body"
)

Comment.find_or_create_by!(
  body: "This is also a unique body for a unique comment"
)

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
