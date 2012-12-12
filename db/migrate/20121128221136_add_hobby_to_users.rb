class AddHobbyToUsers < ActiveRecord::Migration
  def change
     add_column :users, :interests, :text
  end
end
