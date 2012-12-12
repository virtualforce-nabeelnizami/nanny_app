class CreatePreferences < ActiveRecord::Migration
  def change

    create_table :preferences do |t|
      t.boolean :has_car
      t.boolean :smokes
      t.boolean :has_kids
      t.boolean :likes_pets
      t.boolean :prepares_meals
      t.boolean :knows_first_aid
      t.boolean :go_on_trips
      t.boolean :knows_cpr
      t.boolean :military_spouse
      t.boolean :speaks_english
      t.boolean :eligible_to_work
      t.integer :miles_to_travel
      t.belongs_to :user
      t.timestamps
    end
end


end