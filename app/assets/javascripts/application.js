// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require QapTcha.jquery
//= require facebox
//= require rails.validations
//= require jquery.ui.dialog
//= require jquery.toastmessage
//= require jquery-fileupload/basic
//= require_tree .

$(document).ready(function(){
});

(function(){

  $.fn.popbox = function(options){
    var settings = $.extend({
      selector      : this.selector,
      open          : '.open',
      box           : '.box',
      arrow         : '.arrow',
      arrow_border  : '.arrow-border',
      close         : '.close'
    }, options);

    var methods = {
      open: function(event){
        event.preventDefault();

        var pop = $(this);
        var box = $(this).parent().find(settings['box']);

        box.find(settings['arrow']).css({'left': box.width()/2 - 10});
        box.find(settings['arrow_border']).css({'left': box.width()/2 - 10});

        if(box.css('display') == 'block'){
      //    methods.close();
        } else {
          box.css({'display': 'block', 'top': 10, 'left': ((pop.parent().width()/2) -box.width()/2 )});
        }
      },

      close: function(){
        $(settings['box']).fadeOut("fast");
      }
    };

    $(document).bind('keyup', function(event){
      if(event.keyCode == 27){
        //methods.close();
      }
    });

    $(document).bind('click', function(event){
      if(!$(event.target).closest(settings['selector']).length){
       // methods.close();
      }
    });

    return this.each(function(){
      $(this).css({'width': $(settings['box']).width()}); // Width needs to be set otherwise popbox will not move when window resized.
      $(settings['open'], this).bind('click', methods.open);
      $(settings['open'], this).parent().find(settings['close']).bind('click', methods.close);
    });
  }

}).call(this);

  $(document).ready(function(){
      $('.popbox').popbox();
            
      
      $('input.signup[rel="facebox"]').click(function(){
      	
     // $.facebox({ div: '#captcha' });
      });
      $(document).bind('reveal.facebox', function() {
        $('.submit_register').click(function(){
          $('#ajax_signup').submit();          
        });
        length = $('#captcha .QapTcha .bgSlider').length

          if(length == 0){
            $('.QapTcha').QapTcha({
              disabledSubmit:false,
              autoRevert:true,
              autoSubmit:false,
              form: '#ajax_signup'
            });
          }
      })
      $('#save_preferences').click(function(){
        $('form.edit_preferences').submit()
      })


      $(".info-input").DefaultText();

      $("#miles_slider").slider(
        { from: 0, to: 60, scale: [0, '|', '|', 15, '|', '|', 30, '|', '|', 45, '|', '|', 60], round: 1, skin: "round", 
        onstatechange: function( value ){
           $("#miles_count").html(value + ' Miles');
        }}
      );

      $('#create_reference_dialog').click(function(e) {
        var url = $(this).attr('href');
        var dialog_form = $('<div id="dialog-form">Loading form...</div>').dialog({
          autoOpen: false,
          width: 800,
          resizable: false,
          draggable: false,
          modal: true,
          open: function() {
            return $(this).load(url + ' #content');
          },
          close: function() {
            $('#dialog-form').remove();
          }
        });
        dialog_form.dialog('open');
        e.preventDefault();
      });

      $("#reference-close").bind('click',function(){ $('#dialog-form').dialog('close'); });  
   });





function handleClick(el,attr){	
	 val = $('#user_preference_attributes_'+attr);
	 status = val.val()
	 status = status == "false" ? "true" : "false"
	 val.val(status);
	 opacity = status == "false" ? 1 : .3
	 $(el).fadeTo(0, opacity)
	 updateList(attr)
}


function updateList(attr){
	var dont = "don't "
	var are_not = "are not "
	
	val = $('#user_preference_attributes_'+attr).val();
	is_on = val == "true";
	li = $("#"+attr+"_li");
	//span = li.find("span")
	text = li.html()
	if(is_on){
		if(text.indexOf("are not")==-1){
		 text = text.replace(" don't"," ") ;
		}{
		 text = text.replace("are not","are");
		}
	}else{
	  if(text.indexOf(" are ")==-1){
	    text = text.replace(" "," don't ");
	  }else{
	    text = text.replace("are","are not")
	  }
	}
	li.html(text)
}



function updatePreferences(el, status, attr){
		
   if($(el).find('span').text().length < 1){
      $(el).prepend('<span>You don\'t</span> ');
    }else{
      $(el).find('span').toggle();
    }
   if(status==true){
    $(el).attr('onclick').replace('true', 'false')  
   }else{
    $(el).attr('onclick').replace('false', 'true')  
   }
   $('input[name*='+ attr +']').val(status);
}



function popupFacebook(){
	try{
	$.facebox($('#success_reg').html());
   }catch(e){
   	alert(e)
   }

}

function changeToPassword(el){
	
	el.type = "password";
}
