class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.belongs_to :user
      t.integer :level
      t.string :school_name
      t.integer :school_id
      t.string :major
      t.integer :graduation_year
      t.timestamps
    end
  end
end
