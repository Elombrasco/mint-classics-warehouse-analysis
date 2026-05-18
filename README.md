# Mint Classics — Analyse d'Inventaire Entrepôt

## Contexte
Mint Classics Company envisage de fermer l'un de ses 4 entrepôts.
Cette analyse utilise SQL pour identifier lequel peut être fermé tout en
maintenant un délai de livraison de 24h pour tous les clients.

**Conclusion : L'entrepôt D (South) peut être fermé sans risque.**

## Résultats Clés

| Entrepôt | Stock Total | Produits | Capacité Utilisée |
|----------|-------------|----------|-------------------|
| D - South | 79 380     | 23       | 75%               |
| C - West  | 124 880    | 24       | 50%               |
| A - North | 131 688    | 25       | 72%               |
| B - East  | 219 183    | 38       | 67%               |

- L'entrepôt D ne contient que **14% du stock total**
- Les entrepôts A, B, C ont **284 048 unités d'espace libre** — 3.5× le stock de D
- Toutes les commandes en cours dans D ont un stock restant positif — **aucun risque de rupture**
- 1 produit dans D n'a **jamais été commandé** (1985 Toyota Supra — 7 733 unités)
- 6 produits ont un **ratio stock/ventes supérieur à 5** — massivement surstockés

## Requêtes SQL

| Fichier | Description |
|---------|-------------|
| `queries/01_warehouse_stock.sql` | Stock et capacité par entrepôt |
| `queries/02_capacity_remaining.sql` | Espace disponible dans A, B, C après fermeture de D |
| `queries/03_warehouse_d_ratios.sql` | Ratio stock/ventes des produits de l'entrepôt D |
| `queries/04_open_orders_d.sql` | Vérification des commandes en cours avant fermeture |

## Dashboards
Dashboard interactif Tableau :
[Voir sur Tableau Public](https://public.tableau.com/app/profile/frejus.ibatta.obesse/viz/MintClassicsAnalyseInventaireEntreptD/Dashboard1)

HTML/Chart.js → "Dashboard technique — Chart.js: https://elombrasco.github.io/mint-classics-warehouse-analysis/dashboard/dashboard_interactif.html 
## Outils Utilisés
- **MySQL Workbench** — exploration des données et requêtes SQL
- **Tableau Public** — visualisation des données
- **GitHub** — portfolio et versioning
