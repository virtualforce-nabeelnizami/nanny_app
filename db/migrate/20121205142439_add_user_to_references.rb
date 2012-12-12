class AddUserToReferences < ActiveRecord::Migration
  def change
  	add_column :references, :type, :string
  	add_column :references, :user_id, :integer
    add_index  :references, :user_id
  end
end
