class ChangeUidToString < ActiveRecord::Migration
  def change
    change_column :users, :uid, :string
  end

  def down
    change_column :users, :uid, :integer
  end
end
