-- Requête 1 Afficher la liste des noms des focaccias par ordre alphabétique croissant,
SELECT nom FROM focaccia ORDER BY nom ASC;

--résultat obtenu :
Américaine
Gorgonzollaccia
Hawaienne
Mozaccia
aysanne
Raclaccia
Tradizione

-- Requête 2 Afficher le nombre total d'ingrédients
SELECT COUNT(*) AS total_ingredients FROM ingredient;

--résultat obtenu : 
        25

-- Requête 3 Afficher le prix moyen des focaccias,
SELECT ROUND(AVG(prix),2) AS prix_moyen FROM focaccia;

--résultat obtenu : 
        10.38

-- Requête 4 Afficher la liste des boissons avec leur marque, triée par nom de boisson,
SELECT b.nom AS boisson, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;

-- résultat obtenu :
Capri-sun : Coca-cola
Coca-cola original : Coca-cola
Coca-cola zéro : Coca-cola
Eau de source : Cristalline
Fanta citron : Coca-cola
Fanta orange : Coca-cola
Lipton Peach : Pepsico
Lipton zéro citron : Pepsico
Monster energy ultra blue : Monster
Monster energy ultra gold : Monster
Pepsi : Pepsico
Pepsi Max Zéro : Pepsico

-- Requête 5 Afficher la liste des ingrédients pour une Raclaccia
SELECT i.nom AS ingredient, fi.quantite
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE f.nom = 'Raclaccia'
ORDER BY i.nom ASC;

--résultat obtenu :
ingredient        quantite
ail                 2
Base tomate         200
Champignon          40
Cresson             20
Parmesan            50
Poivre              1
Raclette            50

-- Requête 6 Afficher le nom et le nombre d'ingrédients pour chaque foccacia
SELECT f.nom AS focaccia, COUNT(fi.id_ingredient) AS nb_ingredients
FROM focaccia f
LEFT JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
GROUP BY f.id_focaccia, f.nom
ORDER BY f.nom ASC;

--résultat obtenu :
focaccia        nb_ingredients
Américaine              8
Emmentalaccia           7
Gorgonzollaccia         8
Hawaienne               9
Mozaccia                10
Paysanne                12
Raclaccia               7
Tradizione              9


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

--résultat obtenu :
focaccia        nb_ingredients
Paysanne              12

-- Requête 8 Afficher la liste des focaccia qui contiennent de l'ail,
SELECT DISTINCT f.nom AS focaccia
FROM focaccia f
JOIN focaccia_ingredient fi ON f.id_focaccia = fi.id_focaccia
JOIN ingredient i ON fi.id_ingredient = i.id_ingredient
WHERE LOWER(i.nom) = 'ail'
ORDER BY f.nom ASC;
--résultat obtenu :

Gorgonzollaccia
Mozaccia
Paysanne
Raclaccia

-- Requête 9 Afficher la liste des ingrédients inutilisés
SELECT i.nom AS ingredient
FROM ingredient i
LEFT JOIN focaccia_ingredient fi ON i.id_ingredient = fi.id_ingredient
WHERE fi.id_ingredient IS NULL
ORDER BY i.nom ASC;

--résultat obtenu :
Salami
Tomate cerise

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

--résultat obtenu :
Américaine
Hawaienne