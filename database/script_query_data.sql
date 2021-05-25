-- Lấy top 10 thương hiệu được đặt bàn nhiều nhất trong khoảng 1 tháng
select top 10 br.brand_id, br.brand_name, br.avatar, COUNT(*) as number_of_booking from brand as br
join brand_capacity as bc on br.brand_id = bc.brand_id
join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id
where bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3
group by br.brand_id, br.brand_name, br.avatar
order by number_of_booking desc

-- Thống kê top 10 thương hiệu được đặt bàn nhiều nhất theo tháng
select top 10 br.brand_id, br.brand_name, br.avatar, COUNT(*) as number_of_booking from brand as br
join brand_capacity as bc on br.brand_id = bc.brand_id
join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id
where MONTH(bo.date_created) = 4 and bo.booking_status_id = 3
group by br.brand_id, br.brand_name, br.avatar
order by number_of_booking desc


-- Lấy top 10 dịch vụ được đặt bàn nhiều nhất trong khoảng 1 tháng
select top 10 s.service_id, s.service_name, COUNT(*) as number_of_booking from booking_service_detail as bsd
join service as s on bsd.service_id = s.service_id
join booking as bo on bo.booking_id = bsd.booking_id
where bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3
group by s.service_id, s.service_name
order by number_of_booking desc


-- Lấy top 10 thương hiệu được đặt bàn nhiều nhất trong tháng(chỉ thương hiệu, ko có số lượng thống kê)
select b.*
from brand as b
join(
	select top 10 bc.brand_id, COUNT(*) as number_of_booking 
	from brand_capacity as bc
	join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id
	where bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3
	group by bc.brand_id
	order by number_of_booking desc
) as tb on b.brand_id = tb.brand_id


-- Tìm kiếm thương hiệu theo tên, theo trạng thái và sắp xếp theo xu hướng(đặt bàn nhiều trong tháng)
select b.*
from brand as b
left join(
	select bc.brand_id, COUNT(*) as number_of_booking 
	from brand_capacity as bc
	left join booking as bo on bc.brand_capacity_id = bo.brand_capacity_id
	where 
		bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3
	group by bc.brand_id
) as tb on b.brand_id = tb.brand_id
where b.brand_name like N'%%' and b.status = 1
order by number_of_booking desc



-- Tìm kiếm thương hiệu theo tên, theo trạng thái và sắp xếp theo lượt yêu thích
select b.*
from brand as b
left join(
	select bi.brand_id, COUNT(*) as number_of_favourite
	from brand_interaction as bi
	where bi.favourite = 1
	group by bi.brand_id
) as tb on b.brand_id = tb.brand_id
where b.brand_name like N'%%' and b.status = 1
order by number_of_favourite desc

-- Top 10 thương hiện được yêu thích nhất
select top 10 b.brand_id, b.brand_name, b.avatar, number_of_favourite
from brand as b
join(
	select bi.brand_id, COUNT(*) as number_of_favourite
	from brand_interaction as bi
	where bi.favourite = 1 and MONTH(bi.last_view_date) = 5 and YEAR(bi.last_view_date) = 2021
	group by bi.brand_id
) as tb on b.brand_id = tb.brand_id
where b.status = 1
order by number_of_favourite desc




-- Tìm kiếm thương hiệu mã loại hình thương hiệu theo tên, theo trạng thái và sắp xếp theo lượt yêu thích
select b.*
from brand as b
left join(
	select bi.brand_id, COUNT(*) as number_of_favourite
	from brand_interaction as bi
	where bi.favourite = 1
	group by bi.brand_id
) as tb on b.brand_id = tb.brand_id
where b.service_type_id = 1 and b.brand_name like N'%%' and b.status = 1
order by number_of_favourite

-- Lấy top 10 dịch vụ được đặt bàn nhiều nhất trong tháng (chỉ dịch vụ, ko có số lượng thống kê)
select *
from service as s
join (
	select top 10 bsd.service_id, COUNT(*) as number_of_booking 
	from booking_service_detail as bsd
	join booking as bo on bo.booking_id = bsd.booking_id
	where bo.date_created between DATEADD(MONTH, -1, GETDATE()) and GETDATE() and bo.booking_status_id = 3
	group by bsd.service_id
	order by number_of_booking desc
) as tb on s.service_id = tb.service_id




-- Lấy top 10 dịch vụ đang khuyến mãi theo phần trăm khuyến mãi
select top 10 s.*, (s.price_for_adult-s.sale_price_for_adult)/s.price_for_adult*100
from [service] as s
where (s.price_for_adult-s.sale_price_for_adult)/s.price_for_adult*100 >= 10
order by (s.price_for_adult-s.sale_price_for_adult)/s.price_for_adult*100 desc, s.sale_price_for_adult


-- Gợi ý dịch vụ theo lượt yêu thích dịch vụ, lượt yêu thích thương hiệu, đang giảm giá
select top(3) s.*
from [service] as s
join (
	select distinct s.service_id
	from [service] as s
	join brand_interaction as bi on s.brand_id = bi.brand_id
	where bi.account_id = 1 and bi.favourite = 1
	union
	select s.service_id
	from [service] as s
	join service_interaction as si on s.service_id = si.service_id
	where si.account_id = 1 and si.favourite = 1
	union
	select s.service_id
	from [service] as s
	where (s.price_for_adult-s.sale_price_for_adult)/s.price_for_adult*100 >= 10
) as tb on s.service_id = tb.service_id
order by NEWID()


-- Gợi ý dịch vụ theo sở thích
select s.service_id
from [service] as s
join service_interaction as si on s.service_id = si.service_id
where si.account_id = 1 and si.favourite = 1

-- Lịch sử dịch vụ đã xem
select top(12) s.*
from [service] as s
join service_interaction as si on s.service_id = si.service_id
where si.account_id = 1
order by si.last_view_date desc

-- Lịch sử thương hiệu đã xem
select top(12) b.*
from brand as b
join brand_interaction as bi on b.brand_id = bi.brand_id
where bi.account_id = 1
order by bi.last_view_date desc

-- Gợi ý thương hiệu theo lượt yêu thích dịch vụ, lượt yêu thích thương hiệu, đang giảm giá


-- Lấy số tầng và số lượng vị trí đã được đặt trước của một thương hiệu theo thời điểm 
select bc.brand_capacity_id, bc.floor as floor, bc.slot, case when b.num_of_reserved is NULL then 0 else b.num_of_reserved end as NumberOfReserved
from (
	select *
	from brand_capacity as bc
	where bc.brand_id = 1
) as bc 
left join (
	select b.brand_capacity_id, sum(b.number_of_adults+b.number_of_children) as num_of_reserved
	from booking as b
	where b.date_in = '2021-05-01' and b.time_in = '20:00'
	group by b.brand_capacity_id
) as b on bc.brand_capacity_id = b.brand_capacity_id

-- Lấy số lượng vị trí đã được đặt trước của 1 tầng của 1 thương hiệu theo thời điểm 
select bc.brand_capacity_id, bc.floor as floor, bc.slot, case when b.num_of_reserved is NULL then 0 else b.num_of_reserved end as NumberOfReserved
from (
	select *
	from brand_capacity as bc
	where bc.brand_id = 1 and bc.brand_capacity_id = 1
) as bc 
left join (
	select b.brand_capacity_id, sum(b.number_of_adults+b.number_of_children) as num_of_reserved
	from booking as b
	where b.date_in = '2021-05-01' and b.time_in = '10:00'
	group by b.brand_capacity_id
) as b on bc.brand_capacity_id = b.brand_capacity_id


-- Thống kê số lượng đơn đặt bàn theo các tháng(12 tháng) của năm
select m.month, count(b.booking_id) as numberOfBooking 
from temp_month as m 
left join (
	select * from booking as b
	where year(b.date_created) = 2021
) as b on m.month = MONTH(b.date_created)
group by m.month


-- Thống kê số lượng đơn đặt bàn theo các tháng(12 tháng) của năm của một thương hiệu
select m.month, count(tb.booking_id) as numberOfBooking 
from temp_month as m 
left join (
	select b.* from booking as b
	join brand_capacity as bc on b.brand_capacity_id = bc.brand_capacity_id
	where bc.brand_id = 1 and year(b.date_created) = 2021
) as tb on m.month = MONTH(tb.date_created)
group by m.month


-- Thống kế tổng doanh số theo tháng(12 tháng) của một năm
select m.month, 
(case when revenue_of_service is null then 0 else revenue_of_service end + case when revenue_of_products is null then 0 else revenue_of_products end) as totalRevenue
from temp_month as m 
left join (
	select MONTH(b.date_created) as month, 
	SUM(b.number_of_adults*bsd.sale_price_for_adult+b.number_of_children*bsd.sale_price_for_children) as revenue_of_service,
	SUM(bpd.sale_price*bpd.quantity) as revenue_of_products
	from booking as b
	left join booking_product_detail as bpd on b.booking_id = bpd.booking_id
	left join booking_service_detail as bsd on b.booking_id = bsd.booking_id
	left join booking_status as bs on b.booking_status_id = bs.booking_status_id
	where year(b.date_created) = 2021 and bs.booking_status_name like N'%kết thúc%'
	group by MONTH(b.date_created)
) as b on m.month = b.month

-- Lấy tổng giá dịch vụ, tổng giá sản phẩm của một hoá đơn
select b.booking_id, b.date_created, 
SUM(b.number_of_adults*bsd.sale_price_for_adult+b.number_of_children*bsd.sale_price_for_children) as price_of_service,
SUM(bpd.sale_price*bpd.quantity) as price_of_products
from booking as b
left join booking_product_detail as bpd on b.booking_id = bpd.booking_id
left join booking_service_detail as bsd on b.booking_id = bsd.booking_id
left join booking_status as bs on b.booking_status_id = bs.booking_status_id
where year(b.date_created) = 2021 and bs.booking_status_name like N'%kết thúc%'
group by b.booking_id, b.date_created


-- Thống kê doanh số đặt bàn gọi món của từng tháng trong năm
select m.month, case when sales is null then 0 else sales end as sales 
from temp_month as m
left join(
	select MONTH(b.date_in) as month, case when SUM(tb.sales) is null then 0 else SUM(tb.sales-b.deposit) end as sales
	from booking as b 
	join(
		select bpd.booking_id, SUM(bpd.quantity*bpd.sale_price) as sales
		from booking_product_detail as bpd
		group by bpd.booking_id
	) as tb on b.booking_id = tb.booking_id
	where b.booking_status_id = 3 and YEAR(b.date_in) = 2021
	group by MONTH(b.date_in)
) as tb on m.month = tb.month
group by m.month, sales

-- Thống kê doanh số đặt bàn gọi món của từng tháng trong năm của một thương hiệu
select m.month, case when sales is null then 0 else sales end as sales 
from temp_month as m
left join(
	select MONTH(b.date_in) as month, case when SUM(tb.sales) is null then 0 else SUM(tb.sales-b.deposit) end as sales
	from booking as b 
	join brand_capacity as bc on b.brand_capacity_id = bc.brand_capacity_id
	join(
		select bpd.booking_id, SUM(bpd.quantity*bpd.sale_price) as sales
		from booking_product_detail as bpd
		group by bpd.booking_id
	) as tb on b.booking_id = tb.booking_id
	where bc.brand_id = 2 and b.booking_status_id = 3 and YEAR(b.date_in) = 2021
	group by MONTH(b.date_in)
) as tb on m.month = tb.month
group by m.month, sales



-- Thống kê doanh số đặt bàn theo dịch vụ của từng tháng trong một năm
select m.month, case when sales is null then 0 else sales end as sales 
from temp_month as m
left join(
	select MONTH(b.date_in) as month, SUM(b.number_of_children*bsd.sale_price_for_children+b.number_of_adults*sale_price_for_adult - b.deposit) as sales
	from booking as b 
	join booking_service_detail as bsd on b.booking_id = bsd.booking_id
	where b.booking_status_id = 3 and YEAR(b.date_in) = 2021
	group by MONTH(b.date_in)
) as tb on m.month = tb.month
group by m.month, sales


-- Thống kê doanh số đặt bàn theo dịch vụ của từng tháng trong một năm của một thương hiệu
select m.month, case when sales is null then 0 else sales end as sales 
from temp_month as m
left join(
	select MONTH(b.date_in) as month, SUM(b.number_of_children*bsd.sale_price_for_children+b.number_of_adults*sale_price_for_adult - b.deposit) as sales
	from booking as b
	join brand_capacity as bc on b.brand_capacity_id = bc.brand_capacity_id
	join booking_service_detail as bsd on b.booking_id = bsd.booking_id
	where bc.brand_id = 1 and b.booking_status_id = 3 and YEAR(b.date_in) = 2021
	group by MONTH(b.date_in)
) as tb on m.month = tb.month
group by m.month, sales


-- Doanh số của các thương hiệu theo tháng
select br.brand_id, br.avatar, br.brand_name, sum(case when totalPrice is null then 0 else totalPrice end) as totalPrice
from brand as br
left join brand_capacity as bc on br.brand_id = bc.brand_id
left join booking as bo on bo.brand_capacity_id = bc.brand_capacity_id
left join(
	select b.booking_id, b.date_created, 
	SUM(bpd.sale_price*bpd.quantity-b.deposit) as totalPrice
	from booking as b
	join booking_product_detail as bpd on b.booking_id = bpd.booking_id
	where MONTH(b.date_in) = 4 and YEAR(b.date_in) = 2021 and b.booking_status_id = 3
	group by b.booking_id, b.date_created
	union all
	select b.booking_id, b.date_created,
	SUM(b.number_of_adults*bsd.sale_price_for_adult+b.number_of_children*bsd.sale_price_for_children-b.deposit) as totalPrice
	from booking as b
	join booking_service_detail as bsd on b.booking_id = bsd.booking_id
	where MONTH(b.date_in) = 4 and YEAR(b.date_in) = 2021 and b.booking_status_id = 3
	group by b.booking_id, b.date_created
) as tb on bo.booking_id = tb.booking_id
group by br.brand_id, br.avatar, br.brand_name


select *
from booking as b
left join booking_product_detail as bpd on b.booking_id = bpd.booking_id
left join booking_service_detail as bsd on b.booking_id = bsd.booking_id
left join booking_status as bs on b.booking_status_id = bs.booking_status_id
where year(b.date_created) = 2021 and bs.booking_status_name like N'%kết thúc%'


-- Tìm kiếm dịch vụ theo danh mục và tên và giá và trạng thái sắp xếp theo nổi bật
select s.*
from [service] as s
left join service_category as sc on s.category_id = sc.category_id
left join (
	select bsd.service_id, count(*) as number_of_service_booking
	from booking_service_detail as bsd
	join booking as bo on bsd.booking_id = bo.booking_id
	join booking_status as bs on bo.booking_status_id = bs.booking_status_id
	where bs.booking_status_name like N'%kết thúc%'
	group by bsd.service_id
) as tb on s.service_id = tb.service_id
where sc.category_code like '%%' and s.service_name like N'%%' and (s.sale_price_for_adult between 0 and 1000000) and s.status = 1
order by tb.number_of_service_booking desc

-- Tìm kiếm dịch vụ theo danh mục và tên và giá và trạng thái sắp xếp theo lượt yêu thích

select s.*
from [service] as s
left join service_category as sc on s.category_id = sc.category_id
left join (
	select si.service_id, count(*) as number_of_favourite
	from service_interaction as si
	group by si.service_id
) as tb on s.service_id = tb.service_id
where sc.category_code like '%%' and s.service_name like N'%%' and (s.sale_price_for_adult between 0 and 1000000) and s.status = 1
order by tb.number_of_favourite desc

-- Tìm kiếm dịch vụ theo danh mục và tên và giá và trạng thái sắp xếp theo phần trăm giảm giá
select *
from [service] as s
left join service_category as sc on s.category_id = sc.category_id
where sc.category_code like '%%' and s.service_name like N'%%' 
and (s.sale_price_for_adult between 0 and 1000000) and s.status = 1
and s.sale_price_for_adult != s.price_for_adult
order by ((s.price_for_adult-s.sale_price_for_adult)/s.price_for_adult*100) desc



--------------------------------------------------

-- Tìm tất cả booking của thằng accountid có trạng thái đã kết thúc join brand_comment, lấy ra những thằng null, mỗi thg null chính là một thằng cần thêm bình luận
	select bo.booking_id, br.brand_id, br.brand_name, br.avatar, bo.date_created, bo.date_in from booking as bo
	join brand_capacity as bca on bo.brand_capacity_id = bca.brand_capacity_id
	join brand as br on bca.brand_id = br.brand_id
	left join brand_comment as bc on bo.booking_id = bc.booking_id
	where bo.account_id = 1 and bo.booking_status_id = 3 and brand_comment_id is null

