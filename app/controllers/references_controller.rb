class ReferencesController < ApplicationController

	def index	
	end

	def new
		@reference = Reference.new
		@references = current_user.references
	end

	def edit
		@reference = Reference.find(params[:id])
	end

	def update
		@reference = Reference.find(params[:id])
		@reference.reference_types.delete_all
		params[:reference_types].each do |name|
			rt = ReferenceType.new(:name => name)
			@reference.reference_types << rt
		end

		if @reference.update_attributes(params[:reference])
			@references = current_user.references
		end
	end

	def create
		@reference = Reference.new(params[:reference])
		
		if params[:reference_for] == 'General'
			rt = ReferenceType.new(:name => 'ga')
			@reference.reference_types << rt
		else
			params[:reference_types].each do |name|
				rt = ReferenceType.new(:name => name)
				@reference.reference_types << rt
			end
		end
		
		@reference.user_id = current_user.id

		if @reference.save
			@references = current_user.references
		end
	end

	def destroy
		@reference = Reference.find(params[:id])
		@reference.destroy
		@references = current_user.references
		
		respond_to do |format|
			format.html { render :action => "new" }
	        format.js
		end
	end
end
