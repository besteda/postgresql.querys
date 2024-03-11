select product_name,quantity_per_unit from products; --1.ci sorgu
select product_id,product_name from products where discontinued=0; --2.ci sorgu
select product_id,product_name,discontinued from products where discontinued=0; --3.cü sorgu
select product_id,product_name,unit_price from products where unit_price<20; --4.cü sorgu
select product_id,product_name,unit_price from products where unit_price BETWEEN 15 AND 25; --5.ci sorgu
select product_name,units_on_order,units_in_stock from products where units_in_stock<units_on_order; --6.cı sorgu
select * from products where lower(product_name) LIKE 'a%'; --7.ci sorgu
select * from products where lower(product_name) LIKE '%i'; --8.ci sorgu
select unit_price*0.18 AS unit_price_KDV, unit_price+unit_price*18/100 from products --9.cu sorgu
select COUNT(*) from products where unit_price>30; --10.cu sorgu
select lower(product_name),unit_price from products order by unit_price DESC --11.ci sorgu
select (first_name,last_name) AS ad_soyad from employees; --12.ci sorgu
select COUNT(*) from employees where region IS null; --13.cü sorgu
select COUNT(*) from employees where region IS NOT null; --14.cü sorgu
select CONCAT('TR ', upper(product_name))AS modified_product_name from products; --15.ci sorgu
select CONCAT('TR ', upper(product_name))AS modified_product_name from products where unit_price<20; --16.cı sorgu
select product_name,unit_price from products where unit_price=(select MAX(unit_price) from products); --17.ci sorgu
select product_name,unit_price from products order by unit_price DESC limit 10; --18.ci sorgu
select product_name,unit_price from products where unit_price>(select AVG(unit_price) from products); --19.cu sorgu
select SUM(units_in_stock*unit_price) from products; --20.ci sorgu
select COUNT(discontinued) from products where discontinued=1
                                                               --21.sorgu
select COUNT(discontinued) from products where discontinued=0 
select p.product_name,c.category_name from products p JOIN categories c ON p.category_id = c.category_id; --22.ci sorgu
select c.category_name, AVG(p.unit_price) AS average_price from products p JOIN categories c ON p.category_id=c.category_id group by c.category_name; --23.cü sorgu
select p.product_name,c.category_name,p.unit_price from products p JOIN categories c ON p.category_id = c.category_id order by unit_price DESC limit 1; --24.cü sorgu
select p.product_name,c.category_name,s.company_name, SUM(od.quantity) AS toplam from order_details AS od JOIN products p ON p.product_id=od.product_id JOIN categories c ON c.category_id=p.category_id JOIN suppliers AS s ON s.supplier_id=p.supplier_id group by p.product_id,c.category_name,s.company_name order by sum(od.quantity) DESC limit 1; --25.ci sorgu
