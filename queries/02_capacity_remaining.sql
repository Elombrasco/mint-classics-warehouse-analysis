-- Objectif : Vérifier si A, B, C peuvent absorber le stock de D
-- Résultat : Espace libre total = 284 048 unités (3.5x le stock de D)

SELECT
    w.warehouseCode,
    w.warehouseName,
    SUM(p.quantityInStock)                              AS stock_actuel,
    ROUND(SUM(p.quantityInStock) / w.warehousePctCap * 100) AS capacite_totale,
    ROUND(SUM(p.quantityInStock) / w.warehousePctCap * 100)
        - SUM(p.quantityInStock)                        AS espace_libre
FROM warehouses w
JOIN products p ON p.warehouseCode = w.warehouseCode
WHERE w.warehouseCode != 'd'
GROUP BY w.warehouseCode, w.warehouseName, w.warehousePctCap
ORDER BY espace_libre DESC;
