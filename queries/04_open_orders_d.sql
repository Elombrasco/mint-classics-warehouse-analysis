-- Objectif : Vérifier qu'aucune commande en cours ne sera bloquée
-- pendant le déménagement de l'entrepôt D
-- Résultat : Tous les stocks restants sont positifs = fermeture sans risque

SELECT
    p.productCode,
    p.productName,
    p.quantityInStock,
    SUM(od.quantityOrdered)                      AS unites_en_commande,
    p.quantityInStock - SUM(od.quantityOrdered)  AS stock_apres_livraison
FROM products p
JOIN orderdetails od ON od.productCode = p.productCode
JOIN orders o        ON o.orderNumber  = od.orderNumber
WHERE p.warehouseCode = 'd'
AND o.status IN ('In Process', 'On Hold')
GROUP BY p.productCode, p.productName, p.quantityInStock
ORDER BY stock_apres_livraison ASC;
