class CreateRoles < ActiveRecord::Migration
  def change

    create_table :roles do |t|
      t.string :name
      t.references :user_role
      t.timestamps
    end
  end
end
