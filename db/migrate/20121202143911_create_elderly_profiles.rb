class CreateElderlyProfiles < ActiveRecord::Migration
  def change
    create_table :elderly_profiles do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :elderly_profiles, :user_id
  end
end
