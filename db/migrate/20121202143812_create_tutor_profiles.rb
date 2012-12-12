class CreateTutorProfiles < ActiveRecord::Migration
  def change
    create_table :tutor_profiles do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :tutor_profiles, :user_id
  end
end
