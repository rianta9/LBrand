function updateCartProductQuantity(brandId, productId, quantity) {
  var successOptions = {
      autoHideDelay: 1000,
      className: "success",
  };
  
  var errorOptions = {
	  autoHideDelay: 1000,
	  className: "error"
  };
    $.ajax({ // create an AJAX call...
       type: "PUT",
			contentType: "application/json; charset=utf-8",
			url: "/api/v1/cart/" + brandId + "/update-product/" + productId,
			data: JSON.stringify(
				{
					'quantity': quantity
				}
			),
			cache: false,
			success: function (result) {
				console.log(result)
			},
			error: function (err) {
				console.log(err)
				$('.notifyjs-corner').empty();
				$.notify("Cập nhật số lượng thất bại!", errorOptions);
			}
    });
}