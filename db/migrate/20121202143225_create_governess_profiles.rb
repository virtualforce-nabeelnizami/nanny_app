class CreateGovernessProfiles < ActiveRecord::Migration
  def change
    create_table :governess_profiles do |t|
      t.belongs_to :user
      t.timestamps
    end
  end
end
