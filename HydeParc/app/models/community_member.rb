class CommunityMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :community
  validates_presence_of :user_id, :community_id, :role
end
