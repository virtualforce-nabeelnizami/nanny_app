class UsersController < ApplicationController
  
  def create
    @user = User.create(params[:user])
  end

  def update
    @user = current_user
    @user.update_preferences_action = true
    params[:user][:preference_attributes][:miles_to_travel] = params[:miles_slider]
    success = @user.update_attributes(params[:user])    
    if success
      flash[:success] = "Success updated profile"
    else
      flash[:error] = "Error updating profile"
    end
    redirect_to '/dashboard'
  end

  def show
    redirect_to '/dashboard'
  end

end