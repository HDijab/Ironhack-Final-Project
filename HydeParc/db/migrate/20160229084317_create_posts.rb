class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :user, index: true
      t.belongs_to :community, index: true

      t.timestamps null: false
    end
  end
end
