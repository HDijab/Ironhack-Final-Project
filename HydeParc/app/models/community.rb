class Community < ActiveRecord::Base
  has_many :community_members
  has_many :posts
  has_many :users, through: :community_members
end
