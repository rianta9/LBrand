function add(brandId, productId) {
	var element = 'quantityProduct' + productId;
	if (element) {
		var quantity = parseInt(document.getElementById(element).value);
		quantity = quantity + 1;
		document.getElementById(element).value = quantity;
		updateCartProductQuantity(brandId, productId, quantity);
	}
}

function sub(brandId, productId) {
	var element = 'quantityProduct' + productId;
	if (element) {
		var quantity = parseInt(document.getElementById(element).value);
		quantity = quantity - 1;
		if (quantity < 1) quantity = 1;
		document.getElementById(element).value = quantity;
		updateCartProductQuantity(brandId, productId, quantity);
	}
}

function updateListCapacity(brandId) {
	console.log('access function success!');
	var dateIn = $('#dateIn').val();
	var timeIn = $('#timeIn').val();

	var successOptions = {
		autoHideDelay: 2000,
		className: "success"
	};

	var errorOptions = {
		autoHideDelay: 2000,
		className: "error"
	};
	$.ajax({ // create an AJAX call...
		type: "POST",
		contentType: "application/json; charset=utf-8",
		url: "/api/v1/brand-capacity/brand/" + brandId,
		data: JSON.stringify(
			{
				'dateIn': dateIn,
				'timeIn': timeIn
			}
		),
		cache: false,
		success: function(result) {
			console.log(result);
			var listCapacity = $('#capacityId');
			listCapacity.empty();
			for (var i in result) {
				console.log(result[i]);
				var sl = result[i].slot - result[i].numberOfReserved;
				var option = '<option value="' + result[i].brandCapacityId + '">Tầng ' + result[i].floor + '(Còn ' + sl + '/' + result[i].slot + ')</option>';
				console.log(option);
				listCapacity.append(option);
			}
		},
		error: function(err) {
			console.log(err);
		}
	});
}

function addToCart(brandId, productId) {
	var successOptions = {
		autoHideDelay: 2000,
		className: "success",
	};

	var errorOptions = {
		autoHideDelay: 2000,
		className: "error"
	};
	$.ajax({ // create an AJAX call...
		type: "GET",
		contentType: "application/json; charset=utf-8",
		url: "/api/v1/cart/" + brandId + "/add-product/" + productId,
		cache: false,
		success: function(result) {
			console.log(result)
			var quantityProduct = $('#quantityProduct' + result.productId);
			if (quantityProduct.val()) { // đã tồn tại sp
				console.log('Update số lượng sản phẩm!')
				quantityProduct.val(result.quantity);
				var lblProductSalePrice = $('#lblProduct' + result.productId + 'SalePrice');
				var lblProductTotalPriceCartItem = $('#lblProduct' + result.productId + 'TotalPriceCartItem');
				var lblProductTotalPriceCart = $('#lblTotalPriceCart');
				var lblTotalPrice = $('#lblTotalPriceBooking');

				if (lblProductSalePrice) lblProductSalePrice.html('Giá: ' + result.salePrice);
				if (lblProductTotalPriceCartItem) lblProductTotalPriceCartItem.html('Tổng: ' + result.totalPriceCartItem);
				if (lblProductTotalPriceCart) lblProductTotalPriceCart.html('Tổng: ' + result.totalPriceCart);
				if (lblTotalPrice) lblTotalPrice.html(result.totalPriceBooking);
				$('.notifyjs-corner').empty();
				$.notify("Cập nhật số lượng thành công!", successOptions);
			}
			else {
				var lblProductTotalPriceCart = $('#lblTotalPriceCart');
				if (lblProductTotalPriceCart) lblProductTotalPriceCart.html('Tổng: ' + result.totalPriceCart);
				var listCartItem = $('#listCartItem');
				var item = `
					<tr>
						<td width="125" class="align-middle"><img
							src="/${result.avatar}" width="100px"
							height="80px" title="${result.productName}"></td>
						<td><ul>
								<li><a
									href="/product/${result.productId}"
									>${result.productName}</a></li>
								<li><div class="input-group input-group-sm mt-2 mb-1">
	
	
	
										<div class="input-group-prepend">
											<button type="button" class="btn btn-small btn-outline-dark fas fa-minus"
												data-type="minus" data-field=""
												onclick="sub(${result.brandId}, ${result.productId})"></button>
										</div>
										<input type="text" min="1" max="100" pattern="[0-9]*"
											value="${result.quantity}" id="quantityProduct${result.productId}" style="width: 60px"
											onkeypress="return event.charCode >= 48 && event.charCode <= 57"
											
											onchange="updateCartProductQuantity(${result.brandId}, ${result.productId}, this.value)">
										<div class="input-group-append">
											<button type="button" class="btn btn-small btn-outline-dark fas fa-plus"
												data-type="plus" data-field=""
												onclick="add(${result.brandId}, ${result.productId})"></button>
										</div>
									</div></li>
	
	
								<li><span
									id="lblProduct${result.productId}SalePrice"
									>Giá: ${result.salePrice}</span>
								</li>
								<li><span
									id="lblProduct${result.productId}TotalPriceCartItem"
									>Tổng: ${result.totalPriceCartItem}</span>
								</li>
							</ul></td>
						<td class="align-middle"><a
							href="/booking/${result.brandId}/remove/${result.productId}"><i
								class="ion-close"></i></a></td>
					</tr>
					
					`;

				listCartItem.append(item);
				$('.notifyjs-corner').empty();
				$.notify("Đã thêm sản phẩm vào danh sách gọi món!", successOptions);
			}
		},
		error: function(err) {
			console.log(err)
			$('.notifyjs-corner').empty();
			$.notify("Thêm sản phẩm thất bại!", errorOptions);
		}
	});
}

function updateCartProductQuantity(brandId, productId, quantity) {
	if ($.isNumeric(quantity)) {
		var successOptions = {
			autoHideDelay: 2000,
			className: "success",
		};

		var errorOptions = {
			autoHideDelay: 2000,
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
			success: function(result) {
				console.log(result)
				var lblProductSalePrice = $('#lblProduct' + result.productId + 'SalePrice');
				var lblProductTotalPriceCartItem = $('#lblProduct' + result.productId + 'TotalPriceCartItem');
				var lblProductTotalPriceCart = $('#lblTotalPriceCart');
				var lblTotalPrice = $('#lblTotalPriceBooking');

				if (lblProductSalePrice) lblProductSalePrice.html('Giá: ' + result.salePrice);
				if (lblProductTotalPriceCartItem) lblProductTotalPriceCartItem.html('Tổng: ' + result.totalPriceCartItem);
				if (lblProductTotalPriceCart) lblProductTotalPriceCart.html('Tổng: ' + result.totalPriceCart);
				if (lblTotalPrice) lblTotalPrice.html(result.totalPriceBooking);
				$('.notifyjs-corner').empty();
				$.notify("Cập nhật số lượng thành công!", successOptions);
			},
			error: function(err) {
				console.log(err)
				$('.notifyjs-corner').empty();
				$.notify("Cập nhật số lượng thất bại!", errorOptions);
			}
		});
	}
}


function paymentBooking(bookingId) {
	if (!bookingId) return;
	var successOptions = {
		autoHideDelay: 2000,
		className: "success",
	};

	var errorOptions = {
		autoHideDelay: 2000,
		className: "error"
	};
	var submitUrl = '/checkout/payment/' + bookingId;
	$.ajax({
		type: "GET",
		url: submitUrl,
		dataType: 'JSON',
		success: function(x) {
			console.log(x);
			if (x.code === '00') {
				if (window.vnpay) {
					vnpay.open({
						width: 768,
						height: 600,
						url: x.data
					});
				} else {
					location.href = x.data;
				}
				return false;
			} else {
				alert(x.Message);
			}
		},
		error: function(err) {
			console.log(err)
			$('.notifyjs-corner').empty();
			$.notify(err.responseText, errorOptions);
		}
	});
	return false;
}