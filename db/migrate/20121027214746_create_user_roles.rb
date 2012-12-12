class CreateUserRoles < ActiveRecord::Migration
  def change
        
    create_table :user_roles do |t|
      t.references :user 
      t.references :role 
      
    end
    
  end
end
