select p.product_id,p.product_name,s.company_name,s.phone from products as p JOIN suppliers as s on p.supplier_id=s.supplier_id WHERE p.units_in_stock=0; --26.cı sorgu
select o.order_date,e.first_name,e.last_name from orders o join employees e on o.employee_id=e.employee_id WHERE EXTRACT(MONTH FROM o.order_date)=3 AND EXTRACT(YEAR FROM o.order_date)=1998; --27.ci sorgu
select COUNT(*) from orders WHERE EXTRACT (MONTH FROM order_date)=2 AND EXTRACT (YEAR FROM order_date)=1997; --28.ci sorgu
select COUNT(*) from orders WHERE ship_city='London' AND EXTRACT (YEAR FROM order_date)=1998; --29.cu sorgu
select contact_name,phone from customers c INNER JOIN orders o ON o.customer_id=c.customer_id WHERE EXTRACT(YEAR FROM order_date)=1997 --30.cu sorgu
select order_id,freight from orders WHERE freight>40; --31.ci sorgu
select o.ship_city,o.freight,o.order_id,c.company_name from orders o INNER JOIN customers c ON o.customer_id =c.customer_id WHERE freight>40 --32.ci sorgu
select o.order_date, o.ship_city, CONCAT(UPPER(e.first_name), ' ', UPPER(e.last_name)) AS "Employee Name (Capitalized)" from orders AS o INNER JOIN employees AS e ON o.employee_id=e.employee_id WHERE EXTRACT(YEAR FROM order_date)=1997; --33.cü sorgu
select DISTINCT (c.contact_name), c.phone from customers c INNER JOIN orders o ON c.customer_id=o.customer_id WHERE EXTRACT(YEAR FROM order_date)=1997; --34.cü sorgu
select o.order_date,c.contact_name,CONCAT(UPPER(e.first_name), ' ', UPPER(e.last_name)) AS "Employee Name (Capitalized)" from employees e INNER orders o ON e.employee_id=o.employee_id INNER JOIN customers c ON o.customer_id=c.customer_id; --35.ci sorgu
select shipped_date,required_date from orders WHERE shipped_date>required_date; --36.cı sorgu
select o.order_date,o.shipped_date,o.required_date,c.company_name from orders o INNER JOIN customers c on o.customer_id=c.customer_id WHERE shipped_date>required_date; --37.ci sorgu
select o.order_id,p.product_name,c.category_name,o.quantity from order_details o INNER JOIN products p on o.product_id=p.product_id INNER JOIN categories c ON p.category_id=c.category_id WHERE o.order_id=10248; --38.ci sorgu
select o.order_id,p.product_name,s.company_name from orders o INNER JOIN order_details od ON od.order_id=o.order_id INNER JOIN products p ON od.product_id=p.product_id INNER JOIN suppliers s ON p.supplier_id=s.supplier_id WHERE o.order_id=10248; --39.cu sorgu
select od.quantity,p.product_name,e.employee_id from employees e INNER JOIN orders o ON e.employee_id=o.employee_id INNER JOIN order_details od ON o.order_id=od.order_id INNER JOIN products p ON od.product_id=p.product_id WHERE e.employee_id=3 AND EXTRACT (YEAR FROM o.order_date)=1997; --40.cı sorgu
select e.employee_id,e.first_name,e.last_name from employees e WHERE e.employee_id=(select employee_id from orders WHERE EXTRACT(YEAR FROM order_date)=1997 GROUP BY employee_id ORDER BY COUNT(*)DESC LIMIT 1 ); --41.ci sorgu
select e.employee_id,e.first_name,e.last_name from employees e INNER JOIN orders o ON e.employee_id=o.employee_id WHERE o.order_date>='1997-01-01' AND o.order_date<='1997-12-31' GROUP BY e.employee_id,e.first_name,e.last_name ORDER BY(e.employee_id) DESC LIMIT 1 --42.ci sorgu
select p.product_name,c.category_name,p.unit_price from products p INNER JOIN categories c ON p.category_id=c.category_id WHERE unit_price=(select MAX(unit_price) from products); --43.cü sorgu
select e.first_name, e.last_name, o.order_id, o.order_date from employees e INNER JOIN orders o ON e.employee_id=o.employee_id ORDER BY o.order_date ASC --44.cü sorgu
select AVG(p.unit_price) AS average_price from products p INNER JOIN order_details od ON p.product_id=od.product_id INNER JOIN orders o ON od.order_id=o.order_id GROUP BY o.order_id ORDER BY o.order_date ASC LIMIT 5 --45.ci sorgu
select COUNT(*) AS "TOTAL SALES",p.product_name,c.category_name from categories c INNER JOIN products p  ON p.category_id=c.category_id INNER JOIN order_details od ON od.product_id=p.product_id INNER JOIN orders o ON od.order_id=o.order_id WHERE EXTRACT(MONTH FROM order_date)=1 GROUP BY p.product_name,c.category_name; --46.cı sorgu
select AVG(quantity) AS "AVERAGE SALES AMOUNT" from order_details WHERE quantity>(select AVG(quantity)from order_details); --47.ci sorgu
select p.units_on_order,p.product_name,c.category_name,s.company_name from categories c INNER JOIN products p ON p.category_id=c.category_id INNER JOIN suppliers s ON p.supplier_id=s.supplier_id  ORDER BY p.units_on_order DESC LIMIT 1; --48.ci sorgu
select DISTINCT(country) from customers; --49.cu sorgu
select SUM(quantity) AS total_products_sold,e.employee_id from order_details od INNER JOIN orders o ON od.order_id=o.order_id INNER JOIN employees e ON o.employee_id=e.employee_id WHERE e.employee_id = 3 AND order_date>=DATE '2023-01-01' AND order_date<=CURRENT_DATE GROUP BY e.employee_id; --50.ci sorgu
select o.order_id,p.product_name,c.category_name,o.quantity from order_details o INNER JOIN products p on o.product_id=p.product_id INNER JOIN categories c ON p.category_id=c.category_id WHERE o.order_id=10248; --51.ci sorgu
select o.order_id,p.product_name,s.company_name from orders o INNER JOIN order_details od ON od.order_id=o.order_id INNER JOIN products p ON od.product_id=p.product_id INNER JOIN suppliers s ON p.supplier_id=s.supplier_id WHERE o.order_id=10248; --52.ci sorgu
select od.quantity,p.product_name,e.employee_id from employees e INNER JOIN orders o ON e.employee_id=o.employee_id INNER JOIN order_details od ON o.order_id=od.order_id INNER JOIN products p ON od.product_id=p.product_id WHERE e.employee_id=3 AND EXTRACT (YEAR FROM o.order_date)=1997; --53.cü sorgu
select e.employee_id,e.first_name,e.last_name from employees e WHERE e.employee_id=(select employee_id from orders WHERE EXTRACT(YEAR FROM order_date)=1997 GROUP BY employee_id ORDER BY COUNT(*)DESC LIMIT 1); --54.cü sorgu
select e.employee_id,e.first_name,e.last_name from employees e INNER JOIN orders o ON e.employee_id=o.employee_id WHERE o.order_date>='1997-01-01' AND o.order_date<='1997-12-31' GROUP BY e.employee_id,e.first_name,e.last_name ORDER BY(e.employee_id) DESC LIMIT 1 --55.ci sorgu
select p.product_name,c.category_name,p.unit_price from products p INNER JOIN categories c ON p.category_id=c.category_id WHERE unit_price=(select MAX(unit_price) from products); --56.cı sorgu
select e.first_name, e.last_name, o.order_id, o.order_date from employees e INNER JOIN orders o ON e.employee_id=o.employee_id ORDER BY o.order_date ASC --57.ci sorgu
select AVG(p.unit_price) AS average_price from products p INNER JOIN order_details od ON p.product_id=od.product_id INNER JOIN orders o ON od.order_id=o.order_id GROUP BY o.order_id ORDER BY o.order_date ASC LIMIT 5 --58.ci sorgu
select COUNT(*) AS "TOTAL SALES",p.product_name,c.category_name from categories c INNER JOIN products p  ON p.category_id=c.category_id INNER JOIN order_details od ON od.product_id=p.product_id INNER JOIN orders o ON od.order_id=o.order_id WHERE EXTRACT(MONTH FROM order_date)=1 GROUP BY p.product_name,c.category_name; --59.cu sorgu
select AVG(quantity) AS "AVERAGE SALES AMOUNT" from order_details WHERE quantity>(select AVG(quantity)from order_details); --60.cı sorgu
select p.units_on_order,p.product_name,c.category_name,s.company_name from categories c INNER JOIN products p ON p.category_id=c.category_id INNER JOIN suppliers s ON p.supplier_id=s.supplier_id  ORDER BY p.units_on_order DESC LIMIT 1; --61.ci sorgu
select DISTINCT(country) from customers; --62.ci sorgu
select country,COUNT(company_name) AS numbers_of_customers from customers GROUP BY country ORDER BY numbers_of_customers DESC; --63.cü sorgu
select SUM(quantity) AS total_products_sold,e.employee_id from order_details od INNER JOIN orders o ON od.order_id=o.order_id INNER JOIN employees e ON o.employee_id=e.employee_id WHERE e.employee_id = 3 AND order_date>=DATE '2023-01-01' AND order_date<=CURRENT_DATE GROUP BY e.employee_id; --64.cü sorgu
select SUM(od.unit_price * od.quantity) AS endorsement,p.product_id,o.order_date from products p INNER JOIN order_details od ON p.product_id=od.product_id INNER JOIN orders o ON o.order_id=od.order_id WHERE p.product_id=10 AND order_date>=DATE '1996-08-05' AND order_date<=DATE '1996-11-05' GROUP BY p.product_id,o.order_date --65.ci sorgu
select e.employee_id, e.first_name, e.last_name, COUNT(o.order_id) AS total_orders from employees e LEFT JOIN orders o ON e.employee_id=o.employee_id GROUP BY e.employee_id,e.first_name,e.last_name; --66.cı sorgu
select c.customer_id,c.company_name from customers c LEFT JOIN orders o ON o.customer_id=c.customer_id WHERE o.customer_id IS NULL LIMIT 2; --67.ci sorgu
select company_name,contact_name,city,address,country from customers WHERE country='Brazil'; --68.ci sorgu
select company_name,contact_name,city,address,country from customers WHERE country NOT IN ('Brazil') --69.cu sorgu
select company_name,country from customers WHERE country IN ('Spain','France','Germany'); --70.ci sorgu
select company_name,fax from customers WHERE fax IS NULL; --71.ci sorgu
select city,company_name from customers WHERE city='Berlin' OR city='Paris'; --72.ci sorgu
select company_name,city,contact_title from customers WHERE city='México D.F.' AND contact_title='Owner'; --73.cü sorgu
select unit_price,product_name from products WHERE product_name LIKE 'C%'; --74.cü sorgu
select first_name,last_name,birth_date from employees WHERE first_name LIKE 'A%'; --75.ci sorgu
select company_name from customers WHERE company_name ILIKE '%RESTAURANT%'; --76.cı sorgu
select product_name,unit_price from products WHERE unit_price BETWEEN 50 AND 100; --77.ci sorgu
select order_id,order_date from orders WHERE order_date BETWEEN '1996-07-01' AND '1996-12-31'; --78.ci sorgu
select company_name,country from customers WHERE country IN ('Spain','France','Germany'); --79.cu sorgu
select company_name,fax from customers WHERE fax IS NULL; --80.ci sorgu
select company_name,country from customers ORDER BY country; --81.ci sorgu
select product_name,unit_price from products ORDER BY unit_price DESC; --82.ci sorgu
select product_name,unit_price from products ORDER BY unit_price DESC, CASE WHEN units_in_stock IS NULL THEN 1 ELSE 0 END, units_in_stock ASC; --83.cü sorgu
select COUNT(*) AS product_count from products WHERE category_id=1; --84.cü sorgu
select COUNT(DISTINCT country) AS total_countries_exported from customers; --85.ci sorgu
select COUNT(DISTINCT country) AS num_countries, ARRAY_AGG(DISTINCT country) AS exported_countries from customers; --86.cı sorgu
select product_name, unit_price from products ORDER BY unit_price DESC LIMIT 5; --87.ci sorgu
select COUNT(*) AS order_count from orders WHERE customer_id= ('ALFKI') --88.ci sorgu
select COUNT(unit_price) AS total_cost from products; --89.cu sorgu
select COUNT(unit_price*quantity) AS endorsement from order_details od INNER JOIN orders o ON o.order_id=od.order_id WHERE o.order_date BETWEEN '1970-01-01' AND '2024-01-01' --90.cı sorgu
select AVG(unit_price) from order_details --91.ci sorgu
select MAX(unit_price) from order_details --92.ci sorgu
select order_id, (quantity) AS profit from order_details ORDER BY profit LIMIT 1 --93.cü sorgu*
select company_name from customers ORDER BY length(company_name) DESC LIMIT 1 --94.cü sorgu
select first_name,last_name,birth_date from employees --95.ci sorgu
select p.product_name,od.quantity from products p INNER JOIN order_details od ON od.product_id=p.product_id --96.cı sorgu
select COUNT(p.product_name) AS total_product,c.category_name from products p INNER JOIN categories c ON c.category_id=p.category_id GROUP BY category_name --98.ci sorgu
select product_name,units_on_order from products p WHERE units_on_order>1000 --99.cu sorgu
select c.customer_id,c.company_name from customers c LEFT JOIN orders o ON o.customer_id=c.customer_id WHERE o.customer_id IS NULL --100.cu sorgu