@addLanguage = ->
  window.languages = new Array;
  $("#language-add .add").click ->
    val = $("#language-add option:selected").text()
    if languages.indexOf(val) >= 0
      return false
    el  = $('#language-lists .title').last()
    clone = '<div class="title"><span class="label">'+val+'</span><span class="remove">&times;</span></div>'
    if $(el).length > 0
      $(el).after($(clone))
    else
      $('#language-lists .field').before($(clone))
    
    $field  = $('#language-lists .field input[name*="[language]"]').last()
    class_name = val.replace(RegExp(" ", "g"), "_").toLowerCase() 
    if $field.val() == ""
      $field.val(val).attr('class', class_name)
    else
      new_el = duplicateElement($field, val).attr('class', class_name)
    $field.after(new_el)
    languages.push(val)

  $("#language-lists .title .remove").click ->
    val = $(this).siblings('.label').text()
    class_name = val.replace(RegExp(" ", "g"), "_").toLowerCase() 
    $input = $('input[value="'+val+'"]')
    index = languages.indexOf(val) 
    languages.splice index, 1
    if $('[id*="user_languages_attributes"]').length <=2
      $('.'+class_name).val('')
    else
      $('.'+class_name).remove()
    $(this).parent().remove()

  false


@initAvailibiltyTable = ->
  getDateTime = (el) ->
    class_time = $(el).attr("class").split("selected")[0].split(" ")
    worktime = class_time[0].match(/[0-9]/)[0]
    day = class_time[1].match(/[0-9]/)[0]
    hours = $("td.label." + worktime).text().split("-")
    obj_time = new Object
    obj_time.start_hour = ToTwentyfourHourFormat(hours[0])
    obj_time.end_hour = ToTwentyfourHourFormat(hours[1])
    obj_time.day = parseInt(day)
    obj_time

  window.worktimes = new Array()
  $("table#availibilty tbody td").click ->
    unless $(this).hasClass("label")
      $(this).toggleClass "selected"
      if $(this).hasClass("selected")
        time = getDateTime($(this))
        $start_el = $("[id*=\"start_hour\"]").last()
        $end_el = $("[id*=\"end_hour\"]").last()
        $day_el = $("[id*=\"day_of_week\"]").last()
        console.log "start: " + time.start_hour + ",  end: " + time.end_hour + ",  day: " + time.day
        
        class_name = ''+time.start_hour+''+ time.end_hour+''+time.day

        # if $start_el.val()
        if $start_el.val() is ""
          $start_el.val(time.start_hour).attr('class', class_name)
        else
          $new_el1 = duplicateElement($start_el, time.start_hour).attr('class', class_name)
          $start_el.after $new_el1

        if $end_el.val() is ""
          $end_el.val(time.end_hour).attr('class', class_name)
        else
          $new_el2 = duplicateElement($end_el, time.end_hour).attr('class', class_name)
          $end_el.after $new_el2

        if $day_el.val() is ""
          $day_el.val(time.day).attr('class', class_name)
        else
          $new_el3 = duplicateElement($day_el, time.day).attr('class', class_name)
          $day_el.after $new_el3
        worktimes.push()
      else
        class_time = $(this).attr("class").split(" ")        
        index = worktimes.indexOf(class_time)
        time = getDateTime($(this))
        class_name = ''+time.start_hour+''+ time.end_hour+''+time.day
        if $('[id*="user_availabilities_attributes"]').length <=4
          $('.'+class_name).val('')
        else
          $('.'+class_name).remove()
        worktimes.splice index, 1
      false

@ToTwentyfourHourFormat = (string) ->
  t = parseInt(string.match(/[0-9]+/)[0])
  t = t + 12  if string.indexOf("pm") > 0
  t

@duplicateElement = (el, val) ->
  $new_el = $(el).clone()
  idx = parseInt($new_el.attr("name").match(/[0-9]/)[0]) + 1
  new_id = $new_el.attr("id").replace(/[0-9]/, idx)
  new_name = $new_el.attr("name").replace(/[0-9]/, idx)
  $new_el.attr("id", new_id).attr("name", new_name).val val
  $new_el