/**
 * 
 */
package com.rianta9.controller.web;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.rianta9.entity.Account;
import com.rianta9.entity.Brand;
import com.rianta9.entity.Service;
import com.rianta9.repository.AccountRepository;
import com.rianta9.repository.BrandRepository;
import com.rianta9.repository.BrandServiceTypeRepository;
import com.rianta9.repository.ServiceCategoryRepository;
import com.rianta9.repository.ServiceRepository;
import com.rianta9.util.Constants;

/**
 * @author rianta9
 * @datecreated 11 thg 5, 2021 14:14:45
 */

@Controller
public class SearchController {

	@Autowired
	private BrandRepository brandRepository;

	@Autowired
	private BrandServiceTypeRepository brandServiceType;

	@Autowired
	private ServiceRepository serviceRepository;
	
	@Autowired
	private ServiceCategoryRepository serviceCategoryRepository;

	@Autowired
	private AccountRepository accountRepository;


	@GetMapping("/search")
	public String doSearch(Model model, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		String query = request.getParameter("q");
		String pageS = request.getParameter("page");
		String category = request.getParameter("category");
		String priceRange = request.getParameter("priceRange");
		String orderBy = request.getParameter("orderBy");
		
		int page = 0; // page
		try {
			if (pageS != null)
				page = Math.max(0, Integer.valueOf(pageS) - 1);
		} catch (Exception e) {}
		

		/*Đưa lên trang hiển thị*/
		if (query == null || query.isEmpty()) query = "";
		else model.addAttribute("keyword", query);
		
		if(orderBy == null) orderBy = "";
		else if(!orderBy.equals("default")) model.addAttribute("orderBy", orderBy);
		
		
		/*Hiển thị giao diện kết quả*/
		if (type != null) {
			// Hiển thị giao diện trang tìm kiếm thương hiệu
			if (type.equals("brand"))
				return viewSearchBrand(model, query, category, page, orderBy);
			
			// Hiển thị giao diện trang tìm kiếm dịch vụ
			else if (type.equals("service")) {
				BigDecimal minPrice = new BigDecimal(0);
				BigDecimal maxPrice = new BigDecimal(Long.MAX_VALUE);
				
				// Lấy khoảng giá
				if(priceRange != null && !priceRange.isEmpty() && !priceRange.equals("all")) {
					model.addAttribute("priceRange", priceRange);
					if(priceRange.equals("level1")) {
						minPrice = new BigDecimal(100000);
						maxPrice = new BigDecimal(300000);
					}
					else if(priceRange.equals("level2")) {
						minPrice = new BigDecimal(300000);
						maxPrice = new BigDecimal(500000);
					}
					else if(priceRange.equals("level3")) {
						minPrice = new BigDecimal(500000);
						maxPrice = new BigDecimal(1000000);
					}
					else if(priceRange.equals("level4")) {
						minPrice = new BigDecimal(1000000);
						maxPrice = new BigDecimal(2000000);
					}
					else if(priceRange.equals("level5")) {
						minPrice = new BigDecimal(2000000);
					}
				}
				
				// Lấy danh mục dịch vụ
				String categoryCode = "";
				if(category != null && !category.isEmpty() && !category.equals("all")) {
					categoryCode = category;
					model.addAttribute("categoryCode", categoryCode);
				}
				
				return viewSearchService(model, query, categoryCode, priceRange, minPrice, maxPrice, page, orderBy);
			}
				
		}
		return "redirect:/search?type=brand";
	}

	public String viewSearchBrand(Model model, String query, String category, int page, String orderBy) {
		Page<Brand> listData;
		
		/* Truy vấn dữ liệu theo yêu cầu */
		if (category != null && !category.isEmpty()) { // Tìm kiếm theo danh mục và từ khoá và trạng thái
			Integer categoryId = 0;
			try {
				categoryId = Integer.valueOf(category);
				model.addAttribute("serviceTypeId", categoryId);
			} catch (Exception e) {
				e.printStackTrace();
				return "errors/404";
			}
			if (orderBy != null && !orderBy.isEmpty()) { // và sắp xếp theo
				if (orderBy.equals("new")) // thương hiệu mới
					listData = brandRepository
							.findAllByServiceTypeServiceTypeIdAndBrandNameContainingAndStatusOrderByDateCreatedDesc(
									categoryId, query, 1, PageRequest.of(page, 12));
				else if (orderBy.equals("trending")) // nổi bật
					listData = brandRepository.findAllByServiceTypeIdAndBrandNameLikeAndStatusOrderByTrending(
							categoryId, query, 1, PageRequest.of(page, 12));
				else // lượt yêu thích
					listData = brandRepository.findAllByServiceTypeIdAndBrandNameLikeAndStatusOrderByFavourite(
							categoryId, query, 1, PageRequest.of(page, 12));
			} else // Tìm kiếm theo danh mục và từ khoá tìm kiếm và trạng thái
				listData = brandRepository.findAllByServiceTypeServiceTypeIdAndBrandNameContainingAndStatus(categoryId, query,
						Constants.Status.ACTIVE, PageRequest.of(page, 12));
		} else { // Tìm kiếm theo từ khoá tìm kiếm và trạng thái
			if (orderBy != null && !orderBy.isEmpty()) { // và sắp xếp theo
				if (orderBy.equals("new")) // thương hiệu mới
					listData = brandRepository.findAllByBrandNameContainingAndStatusOrderByDateCreatedDesc(query,
							Constants.Status.ACTIVE, PageRequest.of(page, 12));
				else if (orderBy.equals("trending"))  // thương hiệu nổi bật (lượt đặt bàn)
					listData = brandRepository.findAllByBrandNameLikeAndStatusOrderByTrending(query,
							Constants.Status.ACTIVE, PageRequest.of(page, 12));
				else // lượt yêu thích
					listData = brandRepository.findAllByBrandNameLikeAndStatusOrderByFavourite(query,
							Constants.Status.ACTIVE, PageRequest.of(page, 12));
			} else // Tìm kiếm theo từ khoá tìm kiếm và trạng thái
				listData = brandRepository.findAllByBrandNameContainingAndStatus(query, 1, PageRequest.of(page, 12));
		}

		List<Brand> listBrand = listData.toList();
		model.addAttribute("listBrand", listBrand);
		model.addAttribute("topHotService", serviceRepository.findTopBestSellerServiceByMonth(5));
		model.addAttribute("listBrandServiceType", brandServiceType.findAll());
		model.addAttribute("top10Brand", brandRepository.findTopBestSellerBrandByMonth(4));
		
		
		/*Dành cho người dùng đã đăng nhập: List Viewed Brand, List RecommendedService*/
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				model.addAttribute("listViewedBrand", brandRepository.findTopViewedHistory(6, account.getAccountId()));
				model.addAttribute("listRecommendedService",
						serviceRepository.findTopRecommendedService(5, account.getAccountId()));
			}

		}
		
		
		/*Tạo link cho sắp xếp, phân trang*/
		String linkOrderBy = "/search?type=brand";
		String linkPage = "/search?type=brand";
		if(category != null && !category.isEmpty()) {
			linkOrderBy += "&category=" + category;
			linkPage += "&category=" + category;
		}
		
		if(query != null && !query.isEmpty()) {
			linkOrderBy += "&q=" + query;
			linkPage += "&q=" + query;
		}
		
		if(orderBy != null && !orderBy.isEmpty()) {
			linkPage += "&orderBy=" + orderBy;
		}
		
		model.addAttribute("linkPage", linkPage);
		model.addAttribute("linkOrderBy", linkOrderBy);
		

		/*Phân trang*/
		int totalPage = listData.getTotalPages();
		int totalItem = (int)listData.getTotalElements();
		int currentPage = page+1; // Vì paging bắt đầu từ 0, trên view hiển thị từ 1, mà đầu vào đã -1
		int previousPage = currentPage-1;
		if(previousPage < 1) previousPage = 1;
		int nextPage = currentPage+1;
		if(nextPage > totalPage) nextPage = totalPage;
		
		
		model.addAttribute("totalPages", totalPage);
		model.addAttribute("totalItems", totalItem);
		model.addAttribute("previousPage", previousPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("nextPage", nextPage);
		return "web/search-brand";
	}

	
	public String viewSearchService(Model model, String query, String categoryCode, String priceRange, BigDecimal minPrice, BigDecimal maxPrice,
			int page, String orderBy) {
		
		/*Truy vấn dữ liệu theo yêu cầu*/
		Page<Service> listData;		
		
		if (orderBy != null && !orderBy.isEmpty()) { // Tìm kiếm theo danh mục và tên thương hiệu và giá và trạng thái có sắp xếp
			if (orderBy.equals("new")) // sắp xếp theo thương hiệu mới
				listData = serviceRepository
						.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByDateCreatedDesc(
								categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else if (orderBy.equals("sale")) // sắp xếp theo mức giảm giá
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByInSaleDesc(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else if (orderBy.equals("price-desc")) // sắp xếp theo độ nổi bật
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderBySalePriceForAdultDesc(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else if (orderBy.equals("price-asc")) // sắp xếp theo độ nổi bật
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderBySalePriceForAdultAsc(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else if (orderBy.equals("trending")) // sắp xếp theo độ nổi bật
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByTrending(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else // sắp xếp theo lượt yêu thích
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByFavourite(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
		} else // Tìm kiếm không có sắp xếp
			listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatus(categoryCode, query, minPrice, maxPrice,
					Constants.Status.ACTIVE, PageRequest.of(page, 12));
		
		
		/*Gửi dữ liệu lên trang view*/
		List<Service> listService = listData.toList();
		model.addAttribute("listService", listService);
		model.addAttribute("listServiceCategory", serviceCategoryRepository.findAll());
		model.addAttribute("topHotService", serviceRepository.findTopBestSellerServiceByMonth(5));
		model.addAttribute("top10Service", serviceRepository.findTopBestSellerServiceByMonth(10));
		
		
		/*Dành cho người dùng đã đăng nhập: List Viewed Service, List RecommendedService*/
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// Lấy username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				model.addAttribute("listViewedService",
						serviceRepository.findTopViewedHistory(5, account.getAccountId()));
				model.addAttribute("listRecommendedService",
						serviceRepository.findTopRecommendedService(5, account.getAccountId()));
			}
		}
		
		
		/*Tạo link cho sắp xếp, phân trang*/
		String linkOrderBy = "/search?type=service";
		String linkPage = "/search?type=service";
		if(categoryCode != null && !categoryCode.isEmpty()) {
			linkOrderBy += "&category=" + categoryCode;
			linkPage += "&category=" + categoryCode;
		}
		
		if(query != null && !query.isEmpty()) {
			linkOrderBy += "&q=" + query;
			linkPage += "&q=" + query;
		}
		
		if(priceRange != null && !priceRange.isEmpty()) {
			linkOrderBy += "&priceRange=" + priceRange;
			linkPage += "&priceRange=" + priceRange;
		}
		
		if(orderBy != null &&!orderBy.isEmpty()) {
			linkPage += "&orderBy=" + orderBy;
		}
		
		model.addAttribute("linkPage", linkPage);
		model.addAttribute("linkOrderBy", linkOrderBy);
		
		
		/*Phân trang*/
		int totalPage = listData.getTotalPages();
		int totalItem = (int)listData.getTotalElements();
		int currentPage = page+1; // Vì paging bắt đầu từ 0, trên view hiển thị từ 1, mà đầu vào đã -1
		int previousPage = currentPage-1;
		if(previousPage < 1) previousPage = 1;
		int nextPage = currentPage+1;
		if(nextPage > totalPage) nextPage = totalPage;
		
		
		model.addAttribute("totalPages", totalPage);
		model.addAttribute("totalItems", totalItem);
		model.addAttribute("previousPage", previousPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("nextPage", nextPage);
		return "web/search-service";
	}
}
