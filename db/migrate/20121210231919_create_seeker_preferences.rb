class CreateSeekerPreferences < ActiveRecord::Migration
  def change
    create_table :seeker_preferences do |t|
      t.belongs_to :user
      t.boolean :military_spouse
      t.boolean :has_children
      t.boolean :has_elderly
      t.boolean :has_special_needs
      t.boolean :has_pets
      t.integer :care_type
      t.integer :provider_type
      t.integer :time_frame
      t.integer :job_length
      t.timestamps
    end
  end
end
