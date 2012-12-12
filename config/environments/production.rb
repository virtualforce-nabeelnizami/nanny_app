NannyApp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  #config.action_mailer.delivery_method = :smtp 
  config.action_mailer.delivery_method = :smtp
  
  

#  config.action_mailer.smtp_settings = {
 # :address              => 'box877.bluehost.com',
  #:port                 => 26,
 # :domain               => 'app.royalnannycare.com',
 # :user_name            => 'application@app.royalnannycare.com',
 # :password             => 'lemon34lemon34',
 # :authentication       => 'plain',
 # :enable_starttls_auto => true  }
  
  
  
  #config.action_mailer.smtp_settings = {
  #:address              => "smtp.gmail.com",
  #:port                 => 587,
  #:user_name            => 'bf1906@gmail.com',
  #:password             => 'lemon34',
  #:authentication       => 'plain',
  #:enable_starttls_auto => true  }
  
  
  
  
   config.action_mailer.smtp_settings = {
  :address              => "grange.accountservergroup.com",
  :port                 => 25,
  :domain               => "royalnannycare.com",
  :user_name            => 'app@royalnannycare.com',
  :password             => 'JBrothers2@',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }
  
  
  
  

  config.action_mailer.default_url_options = {
    :host => "http://royalnannycare.com"
  }

  

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  
  #Paperclip.options[:command_path] = "C:/Program Files (x86)/ImageMagick-6.8.0-Q16"
end
