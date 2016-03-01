class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :community
  validates_presence_of :description, :user_id, :community_id
  validates :title, presence: true,
                      length: {maximum: 100}
end
