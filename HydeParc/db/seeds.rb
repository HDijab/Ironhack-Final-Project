# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  nickname: 'Halil',
  email: 'halil@example.com',
  password: 'testpassword',
  password_confirmation: 'testpassword'
)

Community.create(
  name: 'Doha',
)

CommunityMember.create(
  user_id: 1,
  community_id: 1,
  role: 'Member'
)