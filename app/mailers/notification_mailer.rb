class NotificationMailer < ActionMailer::Base
  default :to => "info@royalnannycare.com"

  def contact_us(name, email, subject, body)
    @name = name
    @body = body
    @from = email
    
    mail(from=>email, subject=>subject)
  end

  def success_register(user_id)
    @user = User.find(user_id)
    mail(:from=>@user.email, :subject=>"Welcome and thank you for registering at Royalnannycare.com",:from=>"application@app.royalnannycare.com")
  end
end