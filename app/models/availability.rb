class Availability < ActiveRecord::Base

  belongs_to :user
  # validates :day_of_week, :uniqueness=>{ :scope => [:start_hour, :end_hour}
end
