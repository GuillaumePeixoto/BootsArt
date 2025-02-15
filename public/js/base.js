
$(document).ready(function(){

    $('.quantity-right-plus').click(function(e){
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
        $('#quantity').val(quantity + 1);
    });

    $('.quantity-left-minus').click(function(e){
        e.preventDefault();
        var quantity = parseInt($('#quantity').val());
        if(quantity > 1){
            $('#quantity').val(quantity - 1);
        }
    });

    $('#chooseRole').change(function(){
        $('#artisteInputs').toggle('d-none');
        if( $('#chooseRole').is(':checked') ){
            console.log('oui');
            $('#registration_form_roles_1').prop('checked', true);
        } else {
            console.log('non');
            $('#registration_form_roles_1').prop('checked', false);
            $('#registration_form_imageProfil').val('');
            $('#registration_form_banniereProfil').val('');
            $('#registration_form_description').val('');
            $('#banniere-preview').css('display', 'none');
            $('#profil-preview').css('display', 'none');
        }
    });

    if( $('#chooseRole').is(':checked') ){
        $('#artisteInputs').css('display', 'block');
    }

    $('#carousel1').carousel('pause');
    $('#carousel2').carousel('pause');
    $('#carousel3').carousel('pause');

    $('#add_photo #produit_form_photo').change(function(event){
        var src = URL.createObjectURL(event.target.files[0]);
        var preview = document.getElementById("file-preview");
        var preview_block = document.getElementById("block-preview");
        preview.src = src;
        preview.style.display = "block";
        preview_block.style.display = "block";
    });

    $('#add_photo_profil').change(function(event){
        var src = URL.createObjectURL(event.target.files[0]);
        var preview = document.getElementById("profil-preview");
        var preview_block = document.getElementById("block-profil-preview");
        preview.src = src;
        preview.style.display = "initial";
        preview_block.style.display = "block";
    });

    $('#add_photo_banniere').change(function(event){
        var src = URL.createObjectURL(event.target.files[0]);
        var preview = document.getElementById("banniere-preview");
        var preview_block = document.getElementById("block-banniere-preview");
        preview.src = src;
        preview.style.display = "block";
        preview_block.style.display = "block";
    });


});
