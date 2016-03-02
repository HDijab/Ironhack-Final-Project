class AddAboutToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :about, :text
  end
end
