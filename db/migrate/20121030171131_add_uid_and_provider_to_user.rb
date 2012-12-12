class AddUidAndProviderToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :integer
    add_column :users, :provider, :string
  end

  def down
    remove_column :users, :uid, :integer
    remove_column :users, :provider, :string
  end
end
