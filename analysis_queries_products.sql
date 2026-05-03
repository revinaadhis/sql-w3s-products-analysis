
-- 1. Produk apa yang menghasilkan pendapatan tertinggi?
SELECT c.CategoryName, SUM(od.Quantity) AS total_sold
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
JOIN categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;

-- 2. Top 5 produk terlaris?
SELECT p.ProductName,
       SUM(od.Quantity) AS total_sold
FROM order_details od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY total_sold DESC
LIMIT 5;

-- 3. Kategori produk apa yang paling banyak terjual?
SELECT c.CategoryName,
       SUM(od.Quantity) AS total_sold
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
JOIN categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY total_sold DESC;

-- 4.Kategori produk dengan revenue tertinggi
SELECT c.CategoryName,
       SUM(od.Quantity * p.Price) AS total_revenue
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
JOIN categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY total_revenue DESC;


-- 5. Supplier mana yang paling banyak kontribusi penjualan?
SELECT s.SupplierName,
       SUM(od.Quantity) AS total_sold
FROM order_details od
JOIN products p ON od.ProductID = p.ProductID
JOIN suppliers s ON p.SupplierID = s.SupplierID
GROUP BY s.SupplierName
ORDER BY total_sold DESC;