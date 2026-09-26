-- Напишите запросы, которые выводят следующую информацию:
-- 1. имя контакта и город
SELECT contact_name, city FROM customers;

-- 2. идентификатор заказа и разница между датами
SELECT order_id, (shipped_date - order_date) AS delivery_days
FROM orders;

-- 3. все города без повторов
SELECT DISTINCT city FROM customers;

-- 4. количество заказов
SELECT COUNT(*) FROM orders;

-- 5. количество стран, в которые отгружался товар
SELECT COUNT(DISTINCT ship_country) FROM orders;
