-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы в города, заканчивающиеся на 'burg'
SELECT DISTINCT ship_city, ship_country
FROM orders
WHERE ship_city LIKE '%burg';

-- 2. заказы в страны на 'P', отсортированные по весу (топ-10)
SELECT order_id, customer_id, freight, ship_country
FROM orders
WHERE ship_country LIKE 'P%'
ORDER BY freight DESC
LIMIT 10;

-- 3. сотрудники без региона
SELECT first_name, last_name, home_phone
FROM employees
WHERE region IS NULL;

-- 4. количество поставщиков по странам
SELECT country, COUNT(*) AS supplier_count
FROM suppliers
GROUP BY country
ORDER BY supplier_count DESC;

-- 5. суммарный вес заказов по странам (только где регион известен и сумма > 2750)
SELECT ship_country, SUM(freight) AS total_freight
FROM orders
WHERE ship_region IS NOT NULL
GROUP BY ship_country
HAVING SUM(freight) > 2750
ORDER BY total_freight DESC;

-- 6. страны, где есть и заказчики, и поставщики, и работники
SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers
INTERSECT
SELECT country FROM employees;

-- 7. страны, где есть заказчики и поставщики, но нет работников
(SELECT country FROM customers
 INTERSECT
 SELECT country FROM suppliers)
EXCEPT
SELECT country FROM employees;
