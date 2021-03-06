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
		

		/*????a l??n trang hi???n th???*/
		if (query == null || query.isEmpty()) query = "";
		else model.addAttribute("keyword", query);
		
		if(orderBy == null) orderBy = "";
		else if(!orderBy.equals("default")) model.addAttribute("orderBy", orderBy);
		
		
		/*Hi???n th??? giao di???n k???t qu???*/
		if (type != null) {
			// Hi???n th??? giao di???n trang t??m ki???m th????ng hi???u
			if (type.equals("brand"))
				return viewSearchBrand(model, query, category, page, orderBy);
			
			// Hi???n th??? giao di???n trang t??m ki???m d???ch v???
			else if (type.equals("service")) {
				BigDecimal minPrice = new BigDecimal(0);
				BigDecimal maxPrice = new BigDecimal(Long.MAX_VALUE);
				
				// L???y kho???ng gi??
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
				
				// L???y danh m???c d???ch v???
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
		
		/* Truy v???n d??? li???u theo y??u c???u */
		if (category != null && !category.isEmpty()) { // T??m ki???m theo danh m???c v?? t??? kho?? v?? tr???ng th??i
			Integer categoryId = 0;
			try {
				categoryId = Integer.valueOf(category);
				model.addAttribute("serviceTypeId", categoryId);
			} catch (Exception e) {
				e.printStackTrace();
				return "errors/404";
			}
			if (orderBy != null && !orderBy.isEmpty()) { // v?? s???p x???p theo
				if (orderBy.equals("new")) // th????ng hi???u m???i
					listData = brandRepository
							.findAllByServiceTypeServiceTypeIdAndBrandNameContainingAndStatusOrderByDateCreatedDesc(
									categoryId, query, 1, PageRequest.of(page, 12));
				else if (orderBy.equals("trending")) // n???i b???t
					listData = brandRepository.findAllByServiceTypeIdAndBrandNameLikeAndStatusOrderByTrending(
							categoryId, query, 1, PageRequest.of(page, 12));
				else // l?????t y??u th??ch
					listData = brandRepository.findAllByServiceTypeIdAndBrandNameLikeAndStatusOrderByFavourite(
							categoryId, query, 1, PageRequest.of(page, 12));
			} else // T??m ki???m theo danh m???c v?? t??? kho?? t??m ki???m v?? tr???ng th??i
				listData = brandRepository.findAllByServiceTypeServiceTypeIdAndBrandNameContainingAndStatus(categoryId, query,
						Constants.Status.ACTIVE, PageRequest.of(page, 12));
		} else { // T??m ki???m theo t??? kho?? t??m ki???m v?? tr???ng th??i
			if (orderBy != null && !orderBy.isEmpty()) { // v?? s???p x???p theo
				if (orderBy.equals("new")) // th????ng hi???u m???i
					listData = brandRepository.findAllByBrandNameContainingAndStatusOrderByDateCreatedDesc(query,
							Constants.Status.ACTIVE, PageRequest.of(page, 12));
				else if (orderBy.equals("trending"))  // th????ng hi???u n???i b???t (l?????t ?????t b??n)
					listData = brandRepository.findAllByBrandNameLikeAndStatusOrderByTrending(query,
							Constants.Status.ACTIVE, PageRequest.of(page, 12));
				else // l?????t y??u th??ch
					listData = brandRepository.findAllByBrandNameLikeAndStatusOrderByFavourite(query,
							Constants.Status.ACTIVE, PageRequest.of(page, 12));
			} else // T??m ki???m theo t??? kho?? t??m ki???m v?? tr???ng th??i
				listData = brandRepository.findAllByBrandNameContainingAndStatus(query, 1, PageRequest.of(page, 12));
		}

		List<Brand> listBrand = listData.toList();
		model.addAttribute("listBrand", listBrand);
		model.addAttribute("topHotService", serviceRepository.findTopBestSellerServiceByMonth(5));
		model.addAttribute("listBrandServiceType", brandServiceType.findAll());
		model.addAttribute("top10Brand", brandRepository.findTopBestSellerBrandByMonth(4));
		
		
		/*D??nh cho ng?????i d??ng ???? ????ng nh???p: List Viewed Brand, List RecommendedService*/
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// L???y username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				model.addAttribute("listViewedBrand", brandRepository.findTopViewedHistory(6, account.getAccountId()));
				model.addAttribute("listRecommendedService",
						serviceRepository.findTopRecommendedService(5, account.getAccountId()));
			}

		}
		
		
		/*T???o link cho s???p x???p, ph??n trang*/
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
		

		/*Ph??n trang*/
		int totalPage = listData.getTotalPages();
		int totalItem = (int)listData.getTotalElements();
		int currentPage = page+1; // V?? paging b???t ?????u t??? 0, tr??n view hi???n th??? t??? 1, m?? ?????u v??o ???? -1
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
		
		/*Truy v???n d??? li???u theo y??u c???u*/
		Page<Service> listData;		
		
		if (orderBy != null && !orderBy.isEmpty()) { // T??m ki???m theo danh m???c v?? t??n th????ng hi???u v?? gi?? v?? tr???ng th??i c?? s???p x???p
			if (orderBy.equals("new")) // s???p x???p theo th????ng hi???u m???i
				listData = serviceRepository
						.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByDateCreatedDesc(
								categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else if (orderBy.equals("sale")) // s???p x???p theo m???c gi???m gi??
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByInSaleDesc(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else if (orderBy.equals("price-desc")) // s???p x???p theo ????? n???i b???t
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderBySalePriceForAdultDesc(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else if (orderBy.equals("price-asc")) // s???p x???p theo ????? n???i b???t
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderBySalePriceForAdultAsc(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else if (orderBy.equals("trending")) // s???p x???p theo ????? n???i b???t
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByTrending(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
			else // s???p x???p theo l?????t y??u th??ch
				listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatusOrderByFavourite(
						categoryCode, query, minPrice, maxPrice, Constants.Status.ACTIVE, PageRequest.of(page, 12));
		} else // T??m ki???m kh??ng c?? s???p x???p
			listData = serviceRepository.findAllByServiceCategoryCategoryCodeContainingAndServiceNameContainingAndSalePriceForAdultBetweenAndStatus(categoryCode, query, minPrice, maxPrice,
					Constants.Status.ACTIVE, PageRequest.of(page, 12));
		
		
		/*G???i d??? li???u l??n trang view*/
		List<Service> listService = listData.toList();
		model.addAttribute("listService", listService);
		model.addAttribute("listServiceCategory", serviceCategoryRepository.findAll());
		model.addAttribute("topHotService", serviceRepository.findTopBestSellerServiceByMonth(5));
		model.addAttribute("top10Service", serviceRepository.findTopBestSellerServiceByMonth(10));
		
		
		/*D??nh cho ng?????i d??ng ???? ????ng nh???p: List Viewed Service, List RecommendedService*/
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		// L???y username ra
		if (username != null) {
			Account account = accountRepository.findByUsername(username);
			if (account != null) {
				model.addAttribute("listViewedService",
						serviceRepository.findTopViewedHistory(5, account.getAccountId()));
				model.addAttribute("listRecommendedService",
						serviceRepository.findTopRecommendedService(5, account.getAccountId()));
			}
		}
		
		
		/*T???o link cho s???p x???p, ph??n trang*/
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
		
		
		/*Ph??n trang*/
		int totalPage = listData.getTotalPages();
		int totalItem = (int)listData.getTotalElements();
		int currentPage = page+1; // V?? paging b???t ?????u t??? 0, tr??n view hi???n th??? t??? 1, m?? ?????u v??o ???? -1
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
