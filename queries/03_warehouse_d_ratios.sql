-- Objectif : Identifier les produits surstockés dans l'entrepôt D
-- Ratio > 1 = surstock / Ratio < 1 = produit en tension

SELECT
    p.productCode,
    p.productName,
    p.productLine,
    p.quantityInStock,
    COALESCE(SUM(od.quantityOrdered), 0) AS total_vendu,
    ROUND(p.quantityInStock / NULLIF(SUM(od.quantityOrdered), 0), 2) AS ratio_stock_ventes
FROM products p
LEFT JOIN orderdetails od ON od.productCode = p.productCode
WHERE p.warehouseCode = 'd'
GROUP BY p.productCode, p.productName, p.productLine, p.quantityInStock
ORDER BY ratio_stock_ventes DESC;
