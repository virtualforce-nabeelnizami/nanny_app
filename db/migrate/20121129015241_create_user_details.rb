class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.belongs_to :user
      t.boolean :live_in
      t.boolean :summer
      t.integer :respond_by
      t.boolean :get_groceries
      t.boolean :run_errands
      t.boolean :do_light_house_keeping
      t.boolean :do_laundry
      t.timestamps
    end
  end
end
