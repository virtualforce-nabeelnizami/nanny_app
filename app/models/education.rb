class Education < ActiveRecord::Base
  LEVEL = [["School", 1], ["High School", 2], ["College", 3], ["Bachelor", 4]]

  attr_accessible :level, :school_name, :school_id, :major, :graduation_year
  attr_accessor  :degree

  belongs_to :user
end
