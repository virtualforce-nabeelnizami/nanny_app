module UserHelper



   def display_user_preferences_table(preferences)
      top_arr = []      
      bottom_arr = []
      i = 0 
      preferences.attributes.each do |p| 
          next if dont_show(p)       
          img = "#{p[0]}.png"     
          visible = p[1]   
          link = link_to image_tag(img), "javascript:void(0)", :onclick => "handleClick(this,'#{p[0]}')" ,:class=>"fade_#{visible}" 
          li = content_tag(:li,link)
          arr_to_use = true ? top_arr : bottom_arr
          arr_to_use << li
          i+=1
      end 
   
     ul_top = content_tag(:ul,top_arr.join().html_safe,:class=>"preference_icon_list")
     ul_bottom =  content_tag(:ul,bottom_arr.join().html_safe,:class=>"preference_icon_list")
    
     return ul_top + ul_bottom
   end


   def dont_show(p)
     
     #!!p[1] != p[1] || 
     return (%[military_spouse speaks_english eligible_to_work miles_to_travel user_id updated_at created_at id]).include?(p[0])    
     
   end

  def display_user_preferences(preferences)
    arr = []
    preferences.attributes.each do |p|
     next if !!p[1] != p[1] 
      status = !p[1] ? "You don't " : 'You ';
      status2 = !p[1] ? 'You are not ' : 'You are '
      label = case p[0]
        when 'has_car'
          status + 'have a car'
        when 'smokes'
          status + 'smoke'
        when 'has_kids'
          status + 'have kids of your own' 
        when 'likes_pets'
          status + 'like pets'
        when 'prepares_meals'
          status + 'prepare meals'
        when 'knows_first_aid'
          status + 'know first aid'
        when 'go_on_trips'
          status + 'nanny for family on trips' 
        when 'knows_cpr'
          status + 'know CPR'
        when 'speaks_english'
          status + 'speak english fluently' 
        when 'military_spouse'
          status2 + 'a military spouse'      
        when 'eligible_to_work'
          status2  + 'eligible to work in the US'
        else
          nil
        end
       li = content_tag(:li, label,:id=>"#{p[0]}_li")
      arr << li
    end 
    return arr.join().html_safe
  end


end
