-- Objectif : Stock et capacité par entrepôt
-- Résultat : 4 lignes, une par entrepôt

SELECT
    w.warehouseCode,
    w.warehouseName,
    w.warehousePctCap,
    COUNT(p.productCode)   AS nb_produits,
    SUM(p.quantityInStock) AS total_stock
FROM warehouses w
JOIN products p ON p.warehouseCode = w.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName, w.warehousePctCap
ORDER BY total_stock ASC;
