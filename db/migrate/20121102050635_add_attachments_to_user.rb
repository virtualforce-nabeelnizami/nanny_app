class AddAttachmentsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.has_attached_file :photo
    end
  end
end
