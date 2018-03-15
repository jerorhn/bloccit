require 'random_data'

#Create Posts
50.times do
  Post.create!(
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end
Post.find_or_create_by!(title: 'Sample', body: 'This is the sample.')
posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
Comment.find_or_create_by!(post: posts.sample, body: "Sample Comment")

#Create Advertisements
20.times do
  Advertisement.create!(
    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: rand(50..200)
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"
