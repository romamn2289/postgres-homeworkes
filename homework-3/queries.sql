-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
select c.company_name,
	   CONCAT(e.first_name, ' ', e.last_name) as employee_name
from orders o
join customers c on o.customer_id = c.customer_id
join employees e on o.employee_id = e.employee_id
join shippers s on o.ship_via = s.shipper_id
where c.city = 'London'
and e.city = 'London'
and s.company_name = 'United Package'

-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
Select p.product_name,
	   p.units_in_stock,
	   s.contact_name,
	   s.phone
From products p
Join suppliers s on p.supplier_id = s.supplier_id
Join categories cat on p.category_id = cat.category_id
where p.discontinued = 0
  and p.units_in_stock < 25 
  and cat.category_name in ('Dairy Products', 'Condiments')
Order by p.units_in_stock asc;  

-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа


-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
