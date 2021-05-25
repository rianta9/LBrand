function applyDiscountCode(brandId) {
console.log('access function success!')
  var discountCode = $('#discountCode').val();
  var successOptions = {
      autoHideDelay: 1000,
      className: "success",
  };
  
  var errorOptions = {
	  autoHideDelay: 1000,
	  className: "error"
  };
    $.ajax({ // create an AJAX call...
       type: "POST",
			contentType: "application/json; charset=utf-8",
			url: "/api/v1/checkout/" + brandId + "/apply-discount-code/",
			data: JSON.stringify(
				{
					'discountCode': discountCode
				}
			),
			cache: false,
			success: function (result) {
				console.log(result)
				$('#discountCode').val(result.discountCode);
				$('#lblDiscount').html(result.discount);
				$('#lblTotalPriceBooking').html(result.totalPrice);
				$('.notifyjs-corner').empty();
				$.notify("Áp dụng mã giảm giá thành công!", successOptions);
			},
			error: function (err) {
				console.log(err)
				$('.notifyjs-corner').empty();
				$.notify("Mã giảm giá không hợp lệ!", errorOptions);
			}
    });
}