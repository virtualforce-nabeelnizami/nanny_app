module ApplicationHelper
  
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def logged_in?
    
  end
  
  # display a message using the JQuery Toast Message plugin
  # types available: notice, success, warning an error
  def display_toast_message(message, type)
    message = message.is_a?(Array)? message.join("<br/>").html_safe : message
    return nil unless ['notice', 'success', 'warning', 'error'].include? type.to_s.downcase
    result = "<script>"
    result << "$().toastmessage('showToast', {text:\"#{message}\", sticky: true, type:'#{type.to_s.downcase}'});"
    result << "</script>"
    result.html_safe
  end

  def selected_availibility_time(time_string, day)
    hours = time_string.split('-').map{|t| hour_to_int(t.strip)}
    status = "" 
    puts("-----------#{time_string}:   #{hours}")
    if hours.present?
      start_hour = hours[0] 
      end_hour   = hours[1]
      
      current_user.availabilities.each do |avlbl|
        if avlbl.day_of_week == 2
          puts "----#{avlbl.start_hour}, #{start_hour}"
          puts "----#{avlbl.end_hour}, #{end_hour}"
          puts "----#{avlbl.day_of_week}, #{day}"
        end
        status = "selected" if (avlbl.start_hour == start_hour) && (avlbl.end_hour == end_hour) && (avlbl.day_of_week == day)
      end
    end
    return status
  end

  def hour_to_int(hour_string)
    hour = hour_string.match(/[0-9]+/)
    if hour.present?
      hour = hour[0].to_i
      hour = hour + 12 if hour_string.downcase.include?("pm")
    end
    return hour
  end

end
