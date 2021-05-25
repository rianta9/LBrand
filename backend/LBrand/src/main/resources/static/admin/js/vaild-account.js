
jQuery.validator.addMethod('valid_unicode', function (value) {
	 var reunicode = /^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$/ // regex here
		 return value.trim().match(reunicode);
});
jQuery.validator.addMethod('valid_phone', function (value) {
    var regex = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;   
    return value.trim().match(regex);
  });
jQuery.validator.addMethod('valid_username', function (value) {
		if(value){
			if(value.indexOf('') >= 0) return false;
			return true;
		}
        return false;
    
  });
jQuery.validator.addMethod('mypassword', function(value, element) {
    return this.optional(element) || (value.match(/[a-zA-Z]/) && value.match(/[0-9]/));
},
'Mật khẩu phải chứa ít nhất một ký tự số và một ký tự chữ cái.');



$( "#myform" ).validate({
  rules: {
	 'fileImage':{
		 required: true
	 },
	'username':{
		required: true,
	    minlength: 3,
	    maxlength: 50,
	    valid_username: true,
	    valid_unicode: true
	 },
    'fullName':{
    	required: true,
    	minlength: 6,
        maxlength: 50
    },
    'birthday':{
    	required: true
    },
    'password': {
    	required: true,
    	minlength: 8,
    	maxlength: 50,
    	mypassword: true,
    	valid_unicode: true
    },
    'password_again': {
    	required: true,
      equalTo: "#password"
    },
    'email':{
    	required: true,
    	email: true,
    	maxlength: 100
    },
    'phone':{
    	required: true,
    	valid_phone: true
    },
    'address':{
    	required: true,
    	maxlength: 150
    }
  },
    messages:{
    	'fileImage':{
    		required: "Vui lòng thêm ảnh đại diện"
    	},
    	'username':{
    		valid_username: "Tên đăng nhập không được chứ khoảng trắng!",
    		required:"Vui lòng nhập tên đăng nhập!",
    		minlength: "Độ dài quá ngắn",
    	    maxlength: "Quá giới hạn",
    	    valid_unicode: "Tên đăng nhập không được chứa ký tự tiếng việt"
    	},
    	'fullName':{
    		required:"Vui lòng nhập thông tin này!",
    		minlength: "Độ dài quá ngắn",
    	    maxlength: "Quá giới hạn"
    	},
    	'birthday':{
    		required:"Thông tin này không được để trống!"
    	},
    	'email':{
    		required:"Xin nhập địa chỉ Email!",
    		email:"Định dạng email không hợp lệ",
    		maxlength: "Độ dài vượt quá giới hạn"
    	},
    	'phone':{
    		required:"Xin nhập số điện thoại của bạn!",
    		valid_phone: "Số điện thoại không hợp lệ?",
    		
           
    	},
    	'address':{
    		required:"Xin nhập địa chỉ của bạn!",
    		maxlength:"Độ dài quá lớn"
    	},
    	'password':{
    		required: "Vui lòng nhập mật khẩu!",
    		minlength: "Độ dài mật khẩu phải lớn hơn 8!",
    		maxlength: "Độ dài quá giới hạn",
    		 valid_unicode: "Mật khẩu không được chứa ký tự tiếng việt"
    	},
    	'password_again':{
    		required: "Vui lòng xác nhận mật khẩu!",
    		equalTo: "Mật khẩu xác nhận không trùng khớp!"
    	}
    }
  
});
$(document).ready(function(){
    $("#myToast").toast('autohide');
});