/************************************************************************
*************************************************************************
@Name :       	QapTcha - jQuery Plugin
@Revison :    	4.2
@Date : 		06/09/2012  - dd/mm/YYYY
@Author:     	 ALPIXEL Agency - (www.myjqueryplugins.com - www.alpixel.fr)
@License :		 Open Source - MIT License : http://www.opensource.org/licenses/mit-license.php

****************************override  by Kubid****************************
*************************************************************************/
jQuery.QapTcha = {
	build : function(options)
	{
        var defaults = {
			disabledSubmit : true,
			autoRevert : true,
			path : '',
			autoSubmit : false
        };

		if(this.length>0)
		return jQuery(this).each(function(i) {
			/** Vars **/
			var
				opts = $.extend(defaults, options),
				$this = $(this),
				form = $('form').has($this),
				Clr = jQuery('<div>',{'class':'clr'}),
				bgSlider = jQuery('<div>',{'class':'bgSlider'}),
				Slider = jQuery('<div>',{'class':'Slider'}),
				inputQapTcha = jQuery('<input>',{name:generatePass(32),value:generatePass(7),type:'hidden'});

			/** Disabled submit button **/
			if(opts.disabledSubmit) form.find('input[type=\'submit\']').attr('disabled','disabled');

			/** Construct DOM **/
			bgSlider.appendTo($this);
			Clr.insertAfter(bgSlider);
			inputQapTcha.appendTo($this);
			Slider.appendTo(bgSlider);
			$this.show();

			Slider.draggable({
				revert: function(){
					if(opts.autoRevert)
					{
						if(parseInt(Slider.css("left")) > (bgSlider.width()-Slider.width()-10)) return false;
						else return true;
					}
				},
				containment: bgSlider,
				axis:'x',
				stop: function(event,ui){
					if(ui.position.left > (bgSlider.width()-Slider.width()-10))
					{
						// submit form
						$('#captcha_verify').val("captcha_slider");
						$(opts.form).submit()
					}
				}
			});

			function generatePass(nb) {
		        var chars = 'azertyupqsdfghjkmwxcvbn23456789AZERTYUPQSDFGHJKMWXCVBN_-#@';
		        var pass = '';
		        for(i=0;i<nb;i++){
		            var wpos = Math.round(Math.random()*chars.length);
		            pass += chars.substring(wpos,wpos+1);
		        }
		        return pass;
		    }

		});
	}
}; jQuery.fn.QapTcha = jQuery.QapTcha.build;
