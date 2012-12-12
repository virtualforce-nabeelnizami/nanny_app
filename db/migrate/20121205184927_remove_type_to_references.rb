class RemoveTypeToReferences < ActiveRecord::Migration
	def change
		remove_column :references, :type
	end
end
