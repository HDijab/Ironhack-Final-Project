class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :telephone, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :address, :string
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :occupation, :string
    add_column :users, :about, :text
  end
end
