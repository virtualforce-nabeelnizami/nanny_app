class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.integer :phone_number
      t.string :email
      t.string :relationship
      t.string :privacy

      t.timestamps
    end
  end
end
