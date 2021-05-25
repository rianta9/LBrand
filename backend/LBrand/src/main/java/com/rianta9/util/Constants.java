/**
 * 
 */
package com.rianta9.util;

import java.util.ArrayList;
import java.util.List;

import com.rianta9.model.WorkingStatus;

/**
 * @author rianta9
 * @datecreated 7 thg 5, 2021 19:02:24
 */
public class Constants {
	public static class Gender{
		public static String[] getListGender() {
			String[] listGender = {"Nam", "Nữ", "Khác"};
			return listGender;
		}
	}
	
	public static final Integer MAX_BOOKING_TIMES = 10; // Số lần đặt bàn tối đa
	
	public static class BookingStatus{
		public static final Integer WAIT_FOR_CONFIRM = 1; // chờ gọi điện xác nhận
		public static final Integer CONFIRMED = 2; // đã xác nhận
		public static final Integer FINISHED = 3; // đã kết thúc
		public static final Integer CANCELED = 4; // người dùng huỷ đơn
		public static final Integer WAIT_FOR_CONFIRM_AND_UNPAID_DEPOSIT = 5; // chờ xác nhận và chưa thanh toán đặt cọc
		public static final Integer WAIT_FOR_CONFIRM_AND_PAID_DEPOSIT = 6; // chờ xác nhận và đã thanh toán đặt cọc
		public static final Integer CONFIRMED_AND_UNPAID_DEPOSIT = 7; // đã xác nhận và chưa thanh toán đặt cọc
		public static final Integer CONFIRMED_AND_PAID_DEPOSIT = 8; // đã xác nhận và đã thanh toán đặt cọc
		public static final Integer REFUSED = 9; // Đã từ chối đơn đặt bàn
		public static final Integer ARRIVED = 10; // Đã đến
		
	}
	
	public static class BookingType{
		public static final Integer NORMAL = 1;
		public static final String S_NORMAL = "Đặt bàn thông thường";
		public static final Integer BOOKING_SERVICE = 2;
		public static final String S_BOOKING_SERVICE = "Đặt bàn dịch vụ";
		public static final Integer BOOKING_ORDER = 3;
		public static final String S_BOOKING_ORDER = "Đặt bàn gọi món";
	}
	
	public static class Status{
		public static final Integer VISIBLE = 1;
		public static final String S_VISIBLE = "Hiển thị";
		public static final Integer DISABLE = 0;
		public static final String S_DISABLE = "Ẩn";
		public static final Integer ACTIVE = 1;
		public static final String S_ACTIVE = "Hoạt động";
		public static final Integer BLOCKED = 0;
		public static final String S_BLOCK = "Bị chặn";
		
		public static List<WorkingStatus> getListWorkingStatus(){
			List<WorkingStatus> list = new ArrayList<WorkingStatus>();
			list.add(new WorkingStatus(VISIBLE, S_VISIBLE));
			list.add(new WorkingStatus(DISABLE, S_DISABLE));
			return list;
		}
	}
	
	
	public static class PaymentMethod{
		public static final Integer NO_DEPOSIT = 1;
		public static final String S_NO_DEPOSIT = "Thanh toán tại nhà hàng";
		public static final Integer CONFIRM_BEFORE_DEPOSIT = 2;
		public static final String S_CONFIRM_BEFORE_DEPOSIT = "Chờ gọi điện xác nhận trước khi thanh toán";
		public static final Integer DEPOSIT_NOW = 3;
		public static final String S_DEPOSIT_NOW = "Thanh toán qua thẻ ATM nội địa/Internet banking";
	}
  
	public static class StatusAccount{
		private Integer id;
		private String status;
		public StatusAccount(Integer id, String status) {
			this.id = id;
			this.status = status;
		}
		public Integer getId() {
			return id;
		}
		
		public String getStatus() {
			return status;
		}
		
		public static List<StatusAccount> getListStatus() {
			List<StatusAccount> listStatus = new ArrayList<StatusAccount>();
			listStatus.add(new StatusAccount(1, "Hoạt động"));
			listStatus.add(new StatusAccount(0, "Đã khóa"));
			return listStatus;
		}
	}
	
	public static class BookingTime{
		public static List<String> getListTime(){
			List<String> listTime = new ArrayList<>();
			listTime.add("06:00");
			listTime.add("06:30");
			listTime.add("07:00");
			listTime.add("07:30");
			listTime.add("08:00");
			listTime.add("08:30");
			listTime.add("09:00");
			listTime.add("09:30");
			listTime.add("10:00");
			listTime.add("10:30");
			listTime.add("11:00");
			listTime.add("11:30");
			listTime.add("12:00");
			listTime.add("12:30");
			listTime.add("13:00");
			listTime.add("13:30");
			listTime.add("14:00");
			listTime.add("14:30");
			listTime.add("15:00");
			listTime.add("15:30");
			listTime.add("16:00");
			listTime.add("16:30");
			listTime.add("17:00");
			listTime.add("17:30");
			listTime.add("18:00");
			listTime.add("18:30");
			listTime.add("19:00");
			listTime.add("19:30");
			listTime.add("20:00");
			listTime.add("20:30");
			listTime.add("21:00");
			listTime.add("21:30");
			listTime.add("22:00");
			listTime.add("22:30");
			listTime.add("23:00");
			listTime.add("23:30");
			return listTime;
		}
	}

	public static class Role{
		public static final int USER = 1;
	}
}
