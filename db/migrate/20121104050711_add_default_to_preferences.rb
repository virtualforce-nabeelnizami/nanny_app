class AddDefaultToPreferences < ActiveRecord::Migration
  def change
      change_column_default :preferences, :has_car,false
      change_column_default :preferences, :smokes,false
      change_column_default :preferences, :has_kids,false
      change_column_default :preferences, :likes_pets,false
      change_column_default :preferences, :prepares_meals,false
      change_column_default :preferences, :knows_first_aid,false
      change_column_default :preferences, :go_on_trips,false
      change_column_default :preferences, :knows_cpr,false
      change_column_default :preferences, :military_spouse,false
      change_column_default :preferences, :speaks_english,false
      change_column_default :preferences, :eligible_to_work,false
  end
end
