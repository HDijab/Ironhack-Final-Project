class AddRoleToCommunityMembers < ActiveRecord::Migration
  def change
    add_column :community_members, :role, :string, null: false, default: ""
  end
end
