class CreateNannyProfiles < ActiveRecord::Migration
  def change
    create_table :nanny_profiles do |t|
      t.belongs_to :user

      t.timestamps
    end
    add_index :nanny_profiles, :user_id
  end
end
