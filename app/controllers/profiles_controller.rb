class ProfilesController < ApplicationController
  layout false
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def upload_photo
    @user = current_user
  end

  def save_photo
    @user = current_user
    if @user.update_attributes(params[:user])
      if params[:user][:photo].blank?
        render 'show'
      else
        render 'crop'
      end
    else
      render 'upload_photo'
    end
  end

end
