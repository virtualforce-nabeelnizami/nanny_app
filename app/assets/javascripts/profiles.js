$(
    function(){
        $('#photo_uploader_link').click(function(){
            $("<div id='photo_container'></div>").dialog({
                open: function(){
                    $.ajax({
                        dataType: 'script',
                        url: '/profile/upload_photo'
                    });
                },
                title: 'Upload Photo',
                modal: true,
                draggable: false,
                width: 600,
                position: 'top',
                close: function(){
                    $(this).dialog ('destroy').remove ();
                }
            });
        });
    }
);
