class AddShowPhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :show_phone, :boolean

  end
end
