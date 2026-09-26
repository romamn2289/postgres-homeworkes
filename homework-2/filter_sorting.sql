-- Напишите запросы, которые выводят следующую информацию:
-- 1. заказы, доставленные в France, Germany, Spain
SELECT * FROM orders
WHERE ship_country IN ('France', 'Germany', 'Spain');

-- 2. уникальные страны и города
SELECT DISTINCT ship_country, ship_city FROM orders
ORDER BY ship_country, ship_city;

-- 3. сколько дней в среднем уходит на доставку в Германию
SELECT AVG(shipped_date - order_date) AS avg_days
FROM orders
WHERE ship_country = 'Germany';

-- 4. мин и макс цена среди непроданных продуктов
SELECT MIN(unit_price), MAX(unit_price)
FROM products
WHERE discontinued <> 1;

-- 5. мин и макс цена среди непроданных продуктов, которых >= 20
SELECT MIN(unit_price), MAX(unit_price)
FROM products
WHERE discontinued <> 1 AND units_in_stock >= 20;
