-- Requête 1 Afficher la liste des noms des focaccias par ordre alphabétique croissant,
SELECT nom FROM focaccia ORDER BY nom ASC;

-- Requête 2 Afficher le nombre total d'ingrédients
SELECT COUNT(*) AS total_ingredients FROM ingredient;

-- Requête 3 Afficher le prix moyen des focaccias,
SELECT ROUND(AVG(prix),2) AS prix_moyen FROM focaccia;

-- Requête 4 Afficher la liste des boissons avec leur marque, triée par nom de boisson,
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;

-- Requête 5 Afficher la liste des ingrédients pour une Raclaccia
SELECT i.nom AS ingredient, fi.quantite
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom ASC;

-- Requête 6 Afficher le nom et le nombre d'ingrédients pour chaque foccacia
SELECT f.nom AS focaccia, COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom ASC;

-- Requête 7 Afficher le nom de la focaccia qui a le plus d'ingrédients
SELECT focaccia, nb_ingredients FROM (
  SELECT f.nom AS focaccia, COUNT(fi.id_ingredient) AS nb_ingredients
  FROM focaccia f
  LEFT JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
  GROUP BY f.id_focaccia, f.nom
) t
WHERE nb_ingredients = (SELECT MAX(cnt) FROM (
  SELECT COUNT(*) AS cnt
  FROM focaccia_ingredient
  GROUP BY id_focaccia
) s);

-- Requête 8 Afficher la liste des focaccia qui contiennent de l'ail,
SELECT DISTINCT f.nom AS focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE LOWER(i.nom) = 'ail'
ORDER BY f.nom ASC;

-- Requête 9 Afficher la liste des ingrédients inutilisés
SELECT i.nom AS ingredient
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
WHERE fi.id_ingredient IS NULL
ORDER BY i.nom ASC;

-- Requête 10 Afficher la liste des focaccia qui n'ont pas de champignons.
SELECT f.nom AS focaccia
FROM focaccia f
WHERE NOT EXISTS (
  SELECT 1
  FROM focaccia_ingredient fi
  JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
  WHERE fi.id_focaccia = f.id_focaccia
    AND LOWER(i.nom) = 'champignon'
)
ORDER BY f.nom ASC;