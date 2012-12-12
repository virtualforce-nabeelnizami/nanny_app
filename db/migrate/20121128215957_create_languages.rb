class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.belongs_to :user
      t.string :language
      t.timestamps
    end
  end
end
