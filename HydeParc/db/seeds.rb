# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create(
    nickname: Faker::Name.first_name,
    email: Faker::Internet.safe_email,
    password: 'testpassword',
    password_confirmation: 'testpassword'
  )  
end

3.times do
  Community.create(
  name: Faker::Address.city,
  about: Faker::Lorem.paragraph
  )
end

10.times do |i|
  CommunityMember.create(
    user_id: i + 1,
    community_id: 1,
    role: 'member'
  )
end

5.times do |i|
  Post.create(
    user_id: i + 1,
    community_id: 1,
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph
  )
end

5.times do |i|
  3.times do |j|
    Comment.create(
      user_id: j + 1,
      post_id: i + 1,
      content: Faker::Lorem.sentence
    )
  end
end
