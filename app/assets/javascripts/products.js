$(document).on('turbolinks:load', ()=> {
  let buildImg = (index, url)=> {
    let html = `
                <div class="picture_preview not_saved_picture">
                  <img data-index="${index}" src="${url}" width="117.5px" height="118px">
                  <div class="js-remove">削除</div>
                </div>
                `;
    return html;
  }
  let buildFileField = (index)=> {
    let html = `
              <label class="img_upload_container not_saved_uploader" >
                <div class="js-file_group" data-index="${index}">
                  <i class="fas fa-camera product_icon"></i>
                  <input class="js-file" type="file" 
                  name="product[images_attributes][${index}][image]" 
                  id="product_images_attributes_${index}_image">
                  <br>
                  <div class="boxsize__message">
                    クリックしてファイルをアップロード
                  </div>
                </div>
              </label>
                `;
    return html;
  }
 
  // ============================================================

  let fileIndex =  [...Array(200).keys()].map(i => ++i);
  let countNotSavedUploader = $("not_saved_uploader").length;
  let countTotalUploader =  $(".img_upload_container").length;
  let lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden_destroy').hide();
  $(".not_saved_picture:first").remove();
  let countSavedPicture = $(".saved_picture").length;
  let countTotalPicture = $(".picture_preview").length;
  // ============================================================
  if (countSavedPicture == 0) {
    $(".not_saved_picture").remove();

    if (countTotalUploader == 0 ) {
      $('#previews').append(buildFileField(fileIndex[0]));
    } 
    else {
      $(".img_upload_container").hide();
      $(".img_upload_container:last").show();
    }
  } 
  else if (countSavedPicture > 0) {
    $(".img_upload_container").hide();
    $(".not_saved_picture").remove();  
    countTotalPicture = $(".picture_preview").length;
    if (countNotSavedUploader == 0 )  $('.img_upload_container:last').after(buildFileField(fileIndex[0]));

    if ( countTotalPicture == 4 || countTotalPicture == 9 ) {
      $(".boxsize__message").hide();
    } 
    else if (countTotalPicture > 9) {
      $(".img_upload_container").hide();
    }
    else {
      $(".img_upload_container:last").show()
      $(".boxsize__message").show();
    }
  } 

  // ============================================================
  $('#image-box').on('change', '.js-file', function(e) {
    let targetIndex = $(this).parent().data('index');
    let file = e.target.files[0];
    let blobUrl = window.URL.createObjectURL(file);
    $('.js-file_group:last').parent().addClass("hidden_uploader");

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    }
     else {  
      $('.img_upload_container:first').before(buildImg(targetIndex, blobUrl));
      $('#previews').append(buildFileField(fileIndex[targetIndex + 1]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
    let countPicture = $(".picture_preview").length;
    if (countPicture == 4 || countPicture == 9){
      $(".boxsize__message ").hide();
    } else if (countPicture > 9) {
      $(".img_upload_container:last").hide();
    } else {
      $(".boxsize__message ").show();
    }
    $(".hidden_uploader").hide();
  });

  // ============================================================
  $('#image-box').on('click', '.js-remove', function() {
    let targetIndex = $(this).prev().data('index');
    let hiddenCheck = $(`input[data-index="${targetIndex}"]`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    
    if ($('.js-file').length == 0) $('.img_upload_container:first').before(buildFileField(fileIndex[0]));
    let countPicture = $(".picture_preview").length;
    if (countPicture == 9){
      $(".img_upload_container:last").show();
    }
    if (countPicture == 4 || countPicture == 9){
      $(".boxsize__message ").hide();
    } else {
      $(".boxsize__message ").show();
    }
  });
  
  // ============================================================
  
  let shippingChargeId = $("#product_shipping_charges_id").val();
  if (shippingChargeId == false) $("#delivery_hidden").hide();
  
  $('.delivery_name__title').on('change', function() {
    let shippingChargeId = $("#product_shipping_charges_id").val();
    let optionInSpan = [
                        $('#product_shipping_method_id option[value="2"]'),
                        $('#product_shipping_method_id option[value="4"]'),
                        $('#product_shipping_method_id option[value="5"]'),
                        $('#product_shipping_method_id option[value="8"]'),
                        $('#product_shipping_method_id option[value="9"]'),
                        ]
    let countSpan = $(".selector-hide").length;
    if (shippingChargeId == 1) {
      $('#delivery_hidden').show();
      if (countSpan == 5){
        optionInSpan.forEach( function(show_option){
          show_option.unwrap();
        });
      };
    } 
    else if (shippingChargeId == 2) {
      $('#delivery_hidden').show();
      if (countSpan !== 5) {
        optionInSpan.forEach( function(hide_option){
          hide_option.wrap('<span class="selector-hide"></span>');
        });
      }
    }
     else {
      $('#delivery_hidden').hide();
    };
  });
});
