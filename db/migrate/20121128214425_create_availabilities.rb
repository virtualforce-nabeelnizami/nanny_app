class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.belongs_to :user
      t.integer :start_hour
      t.integer :end_hour
      t.integer :day_of_week
      t.timestamps
    end
  end
end
