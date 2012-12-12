class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource
    # debugger
    resource.skip_confirmation!
    @success = resource.save
    if  @success #&& verified_captcha(params)
     if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        #NotificationMailer.success_register(current_user.id).deliver
        respond_to do |format|
          format.html { respond_with resource, :location => after_sign_up_path_for(resource) }
          format.js{}
        end              
      else        
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_to do |format|
          format.html { respond_with resource, :location => after_inactive_sign_up_path_for(resource) }
          format.js  { }
        end        
      end
    else
      @messages = resource.errors.full_messages.join(", ")
      clean_up_passwords resource
      set_flash_message :error, "captcha failed"
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js  { }
      end    
    end
  end

  protected

  # def check_request_and_respond(resource, location_path, status=true)
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @posts }
  #   end
  #   if request.xhr?
      
  #   else
  #     respond_with resource, :location => location_path
  #   end 
  # end

  def verified_captcha(params)
    (params[:captcha_verify] == "captcha_slider") || verify_recaptcha(:private_key => '6LdsmNgSAAAAAExl-jXEPmOXoXj8gaMqmwtXvcut')
  end

  def after_sign_up_path_for(resource)
    '/dashboard'
  end
  
  
  def after_inactive_sign_up_path_for(resource)
    '/dashboard'
  end
end