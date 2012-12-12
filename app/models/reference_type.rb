class ReferenceType < ActiveRecord::Base
  belongs_to :reference

  PROFILE_TYPES = {'Baby Sitter' => 'bs', 'Nanny' => 'na', 'Governess' => 'go', 'Pet Sitter' => 'ps', 
  					 'HouseKeeper' => 'hk', 'Senior Care' => 'sc', 'Tutor' => 'tu' }

  RELATIONSHIPS = {'Friend' => 'fa', 'Co-Worker' => 'cw', 'Family' => 'fa' }
end
