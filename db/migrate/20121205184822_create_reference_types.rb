class CreateReferenceTypes < ActiveRecord::Migration
  def change
    create_table :reference_types do |t|
      t.string :name
      t.belongs_to :reference

      t.timestamps
    end
    add_index :reference_types, :reference_id
  end
end
