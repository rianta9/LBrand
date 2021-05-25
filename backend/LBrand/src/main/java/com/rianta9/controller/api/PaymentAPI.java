/**
 * 
 */
package com.rianta9.controller.api;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.rianta9.config.ConfigVNPay;
import com.rianta9.entity.Account;
import com.rianta9.entity.Booking;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BookingRepository;
import com.rianta9.repository.BookingStatusRepository;
import com.rianta9.repository.InvoiceRepository;
import com.rianta9.util.Constants;
import com.rianta9.util.DateTimeUtil;
import com.rianta9.util.RandomUUID;

/**
 * @author rianta9
 * @datecreated 18 thg 5, 2021 01:46:52
 */

@RestController
public class PaymentAPI {
	@Autowired
	private BookingRepository bookingRepository;

	
	@Autowired
	private AccountRepository accountRepository;
	
	@GetMapping(value = "/checkout/payment/{bookingId}")
	public ResponseEntity<?> vnpay_ajax(HttpServletRequest request, HttpServletResponse response,@PathVariable Long bookingId)
			throws UnsupportedEncodingException {
		
		if(bookingId == null) return new ResponseEntity<String>("Yêu cầu không hợp lệ!", HttpStatus.BAD_REQUEST);
		Booking booking = bookingRepository.findByBookingId(bookingId);
		if(booking == null) return new ResponseEntity<String>("Không tìm thấy đơn đặt bàn!", HttpStatus.BAD_REQUEST);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		if(username == null) return new ResponseEntity<String>("Bạn cần phải đăng nhập!", HttpStatus.BAD_REQUEST);

		Account account = accountRepository.findByUsername(username);
		if(account == null) return new ResponseEntity<String>("Bạn cần phải đăng nhập!", HttpStatus.BAD_REQUEST);
		
		// Xác nhận người sở hữu đơn đặt bàn
		if(booking.getAccount().getAccountId() != account.getAccountId()) {
			return new ResponseEntity<String>("Đơn đặt bàn này không thuộc sở hữu của bạn!", HttpStatus.BAD_REQUEST);
		}
		
		// Xác nhận đơn đặt bàn này cần phải thanh toán đặt cọc
		if(booking.getBookingStatus().getBookingStatusId() != Constants.BookingStatus.CONFIRMED_AND_UNPAID_DEPOSIT 
			&& booking.getBookingStatus().getBookingStatusId() != Constants.BookingStatus.WAIT_FOR_CONFIRM_AND_UNPAID_DEPOSIT ) {
			return new ResponseEntity<String>("Đơn đặt bàn này hiện tại không yêu cầu thanh toán đặt cọc!", HttpStatus.BAD_REQUEST);
		}
		
		
		
		String vnp_Version = "2.0.0";
		String vnp_Command = "pay";
		String vnp_OrderInfo = "Thanh toan tien dat coc cho don dat ban: #" + booking.getBookingId() + ", thoi diem: " + DateTimeUtil.toStringDateTimeType(new Date());
		String orderType = "billpayment";
//		String vnp_TxnRef = ConfigVNPay.getRandomNumber(8);
		String vnp_TxnRef = booking.getBookingId().toString();
		String vnp_IpAddr = ConfigVNPay.getIpAddress(request);
		String vnp_TmnCode = ConfigVNPay.vnp_TmnCode;

		String vnp_TransactionNo = RandomUUID.getRandomID();
		String vnp_hashSecret = ConfigVNPay.vnp_HashSecret;

		long amount = booking.getDeposit().longValue() * 100; // nhan 100 de bo phan thap phan(VNPay noi vay)
		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", vnp_Version);
		vnp_Params.put("vnp_Command", vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(amount));
		vnp_Params.put("vnp_CurrCode", "VND");
		
//		String bank_code = null; // de nguoi dung chon tren VNPay luon
//		if (bank_code != null && !bank_code.isEmpty()) {
//			vnp_Params.put("vnp_BankCode", bank_code);
//		}
		
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
		vnp_Params.put("vnp_OrderType", orderType);

		String locate = "vn";
		vnp_Params.put("vnp_Locale", locate);
		
		vnp_Params.put("vnp_ReturnUrl", ConfigVNPay.vnp_Returnurl);
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

		Date dt = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateString = formatter.format(dt);
		String vnp_CreateDate = dateString;
		String vnp_TransDate = vnp_CreateDate;
		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		// Build data to hash and querystring
		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				// Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(fieldValue);
				// Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));

				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();
		String vnp_SecureHash = ConfigVNPay.Sha256(ConfigVNPay.vnp_HashSecret + hashData.toString());
		// System.out.println("HashData=" + hashData.toString());
		queryUrl += "&vnp_SecureHashType=SHA256&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = ConfigVNPay.vnp_PayUrl + "?" + queryUrl;
		com.google.gson.JsonObject job = new JsonObject();
		job.addProperty("code", "00");
		job.addProperty("message", "success");
		job.addProperty("data", paymentUrl);
		Gson gson = new Gson();
		return ResponseEntity.ok(gson.toJson(job));
	}
}
