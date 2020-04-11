$(function(){
  $(".product_form").validate({
    errorElement: "span",
    errorClass: "alert",
    rules: {
      "picture_upload": {
        required: true
      },
      "product[name]": {
        required: true,
        maxlength: 40
      },
      "product[text]": {
        required: true,
        maxlength: 1000
      },
      
      "product[parent_name]": {
        required: true
      },
      "child_id": {
        required: true
      },
      "product[child_id]": {
        required: true
      },
      "product[category_id]": {
        required: true
      },
      "product[size_id]": {
        required: true
      },
      "product[products_status_id]": {
        required: true
      },
      "product[shipping_charges_id]": {
        required: true
      },
      "product[shipping_method_id]": {
        required: true
      },
      "product[delivery_area_id]": {
        required: true
      },
      "product[estimated_delivery_date_id]": {
        required: true
      },
      "product[selling_price]": {
        required: true
      },
    },
    messages: {
      "product[images_attributes][0][image]": {
        required: "画像は必須です。(１枚以上１０枚以下)",
      },
      "product[name]": {
        required: "商品名を入力してください。",
        maxlength: "商品名は40文字以内で入力してください。"
      },
      "product[text]": {
        required: "商品の説明を入力してください",
        maxlength: "商品名は1000文字以内で入力してください。"
      },
      "product[parent_name]": {
        required: "カテゴリー全てを選択してください"
      },
      child_id: {
        required: "カテゴリー全てを選択してください"
      },
      "product[category_id]": {
        required: "カテゴリー全てを選択してください"
      },
      "product[size_id]": {
          required: "サイズを選択してください"
      },
      "product[products_status_id]": {
        required: "商品の状態を選択してください"
      },
      "product[shipping_charges_id]": {
        required: "配送料の負担を選択してください"
      },
      "product[shipping_method_id]": {
        required: "配送の方法を選択してください"
      },
      "product[delivery_area_id]" : {
        required: "配送元の地域を選択してください"
      },
      "product[estimated_delivery_date_id]": {
        required: "配送までの日数を選択してください"
      },
      "product[selling_price]" : {
        required: "販売価格を入力してください"
      }
    }
  });
  $("#submit").on("mouseenter", function() {
  let picturePreviewCount = $(".picture_preview").length;
  if (picturePreviewCount == 0) {
    $("html,body").animate({scrollTop:0});
    alert("画像は１枚以上必要です");
  }
});
});


