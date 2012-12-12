class AddInfoToUsers < ActiveRecord::Migration
  def change
     add_column :users, :date_of_birth, :date
     add_column :users,:phone_number,:string
     add_column :users,:religion,:string
     add_column :users,:accepted_terms,:boolean
  end
 

end
