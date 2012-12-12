class CreateHouseKeepingProfiles < ActiveRecord::Migration
  def change
    create_table :house_keeping_profiles do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :house_keeping_profiles, :user_id
  end
end
