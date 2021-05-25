$("#myform").validate({
	rules : {
		serviceTypeName : {
			required : true,
			maxlength :80
		}
	},
	messages : {
		serviceTypeName:{
			required:"Xin nhập tên loại hình muốn thêm!",
			maxlength:"Độ dài chuỗi quá lớn. Vui lòng nhập lại!"
		}
	}
});
$("#myformupdate").validate({
	rules : {
		serviceTypeName : {
			required : true,
			maxlength :80
		}
	},
	messages : {
		serviceTypeName:{
			required:"Xin nhập tên loại hình muốn thêm!",
			maxlength:"Độ dài chuỗi quá lớn. Vui lòng nhập lại!"
		}
	}
});