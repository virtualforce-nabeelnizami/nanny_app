class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  def user_location(ip=nil)
     ip = ip.nil? ? request.remote_ip : ip
    begin
     # ip = Rails.env.development? ? '157.166.249.10': ip
      return Geocoder.search(ip)
    rescue
      return Geocoder.search("")
    end
  end
  
  
  
  
  def require_confirmed
    unless user_signed_in? && current_user.confirmed?
     # flash[:error] = "You must be confirmed to access this section"
      redirect_to "/dashboard",:status=>302
    end
  end
  
end
