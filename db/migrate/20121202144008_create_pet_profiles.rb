class CreatePetProfiles < ActiveRecord::Migration
  def change
    create_table :pet_profiles do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :pet_profiles, :user_id
  end
end
