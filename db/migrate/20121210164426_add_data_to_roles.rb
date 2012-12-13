class AddDataToRoles < ActiveRecord::Migration
  def self.up
    Role.create( :name => "Provider")
    Role.create(:name => "Care_Seeker")
  end
  def self.down
    Role.delete_all()
  end
end