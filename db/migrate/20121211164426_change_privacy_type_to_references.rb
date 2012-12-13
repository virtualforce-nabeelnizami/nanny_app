class ChangePrivacyTypeToReferences < ActiveRecord::Migration
	def change
		rename_column :references, :privacy, :boolean
		change_column :references, :private, :boolean
	end
end
