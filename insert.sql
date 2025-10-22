USE tifosi;

-- Marques 

INSERT IGNORE INTO marque (nom) VALUES
  ('Coca-cola'),
  ('Pepsico'),
  ('Monster'),
  ('Cristalline');


-- Boissons

INSERT IGNORE INTO boisson (nom, prix, id_marque) VALUES
  ('Coca-cola zéro', 2.50, (SELECT id_marque FROM marque WHERE nom = 'Coca-cola' LIMIT 1)),
  ('Coca-cola original', 2.50, (SELECT id_marque FROM marque WHERE nom = 'Coca-cola' LIMIT 1)),
  ('Fanta citron', 2.50, (SELECT id_marque FROM marque WHERE nom = 'Coca-cola' LIMIT 1)),
  ('Fanta orange', 2.50, (SELECT id_marque FROM marque WHERE nom = 'Coca-cola' LIMIT 1)),
  ('Capri-sun', 2.50, (SELECT id_marque FROM marque WHERE nom = 'Coca-cola' LIMIT 1)),
  ('Pepsi', 2.50, (SELECT id_marque FROM marque WHERE nom = 'Pepsico' LIMIT 1)),
  ('Pepsi Max Zéro', 2.50, (SELECT id_marque FROM marque WHERE nom = 'Pepsico' LIMIT 1)),
  ('Lipton zéro citron', 2.50, (SELECT id_marque FROM marque WHERE nom = 'Pepsico' LIMIT 1)),
  ('Lipton Peach', 2.50, (SELECT id_marque FROM marque WHERE nom = 'Pepsico' LIMIT 1)),
  ('Monster energy ultra gold', 3.00, (SELECT id_marque FROM marque WHERE nom = 'Monster' LIMIT 1)),
  ('Monster energy ultra blue', 3.00, (SELECT id_marque FROM marque WHERE nom = 'Monster' LIMIT 1)),
  ('Eau de source', 1.50, (SELECT id_marque FROM marque WHERE nom = 'Cristalline' LIMIT 1));


-- Ingrédients 

INSERT IGNORE INTO ingredient (nom) VALUES
  ('Base tomate'), ('Base crème'), ('Mozarella'), ('Gorgonzola'), ('Raclette'),
  ('Emmental'), ('Chèvre'), ('Cresson'), ('Jambon fumé'), ('Jambon cuit'),
  ('Bacon'), ('Ananas'), ('Piment'), ('Parmesan'), ('Poivre'),
  ('Olive noire'), ('Olive verte'), ('Champignon'), ('Artichaut'),
  ('Pomme de terre'), ('Œuf'), ('Oignon'), ('Salami'), ('Tomate cerise'),
  ('Ail');

-- Focaccias 

INSERT IGNORE INTO focaccia (nom, prix) VALUES
  ('Mozaccia', 9.80),
  ('Gorgonzollaccia', 10.80),
  ('Raclaccia', 8.90),
  ('Emmentalaccia', 9.80),
  ('Tradizione', 8.90),
  ('Hawaienne', 11.20),
  ('Américaine', 10.80),
  ('Paysanne', 12.80);


-- Associations focaccia_ingredient :

-- Mozaccia
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Base tomate' LIMIT 1), 200),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Mozarella' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Cresson' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Jambon fumé' LIMIT 1), 80),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Ail' LIMIT 1), 2),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Artichaut' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon' LIMIT 1), 40),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Parmesan' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Poivre' LIMIT 1), 1),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Mozaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Olive noire' LIMIT 1), 20)
ON DUPLICATE KEY UPDATE quantite = VALUES(quantite);

-- Gorgonzollaccia
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Gorgonzollaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Base tomate' LIMIT 1), 200),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Gorgonzollaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Gorgonzola' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Gorgonzollaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Cresson' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Gorgonzollaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Ail' LIMIT 1), 2),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Gorgonzollaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon' LIMIT 1), 40),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Gorgonzollaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Parmesan' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Gorgonzollaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Poivre' LIMIT 1), 1),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Gorgonzollaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Olive noire' LIMIT 1), 20)
ON DUPLICATE KEY UPDATE quantite = VALUES(quantite);

-- Raclaccia
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Raclaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Base tomate' LIMIT 1), 200),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Raclaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Raclette' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Raclaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Cresson' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Raclaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Ail' LIMIT 1), 2),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Raclaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon' LIMIT 1), 40),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Raclaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Parmesan' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Raclaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Poivre' LIMIT 1), 1)
ON DUPLICATE KEY UPDATE quantite = VALUES(quantite);

-- Emmentalaccia
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Emmentalaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Base crème' LIMIT 1), 200),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Emmentalaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Emmental' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Emmentalaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Cresson' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Emmentalaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon' LIMIT 1), 40),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Emmentalaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Parmesan' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Emmentalaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Poivre' LIMIT 1), 1),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Emmentalaccia' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Oignon' LIMIT 1), 20)
ON DUPLICATE KEY UPDATE quantite = VALUES(quantite);

-- Tradizione
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Tradizione' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Base tomate' LIMIT 1), 200),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Tradizione' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Mozarella' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Tradizione' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Cresson' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Tradizione' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Jambon cuit' LIMIT 1), 80),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Tradizione' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon' LIMIT 1), 40),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Tradizione' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Parmesan' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Tradizione' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Poivre' LIMIT 1), 1),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Tradizione' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Olive noire' LIMIT 1), 10),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Tradizione' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Olive verte' LIMIT 1), 10)
ON DUPLICATE KEY UPDATE quantite = VALUES(quantite);

-- Hawaienne
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Hawaienne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Base tomate' LIMIT 1), 200),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Hawaienne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Mozarella' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Hawaienne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Cresson' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Hawaienne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Bacon' LIMIT 1), 80),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Hawaienne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Ananas' LIMIT 1), 40),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Hawaienne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Piment' LIMIT 1), 2),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Hawaienne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Parmesan' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Hawaienne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Poivre' LIMIT 1), 1),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Hawaienne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Olive noire' LIMIT 1), 20)
ON DUPLICATE KEY UPDATE quantite = VALUES(quantite);

-- Américaine
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Américaine' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Base tomate' LIMIT 1), 200),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Américaine' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Mozarella' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Américaine' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Cresson' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Américaine' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Bacon' LIMIT 1), 80),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Américaine' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Pomme de terre' LIMIT 1), 80),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Américaine' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Parmesan' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Américaine' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Poivre' LIMIT 1), 1),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Américaine' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Olive noire' LIMIT 1), 20)
ON DUPLICATE KEY UPDATE quantite = VALUES(quantite);

-- Paysanne
INSERT INTO focaccia_ingredient (id_focaccia, id_ingredient, quantite) VALUES
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Base crème' LIMIT 1), 200),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Chèvre' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Cresson' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Pomme de terre' LIMIT 1), 80),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Jambon fumé' LIMIT 1), 80),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Ail' LIMIT 1), 2),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Artichaut' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon' LIMIT 1), 40),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Parmesan' LIMIT 1), 50),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Poivre' LIMIT 1), 1),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Olive noire' LIMIT 1), 20),
  ((SELECT id_focaccia FROM focaccia WHERE nom = 'Paysanne' LIMIT 1), (SELECT id_ingredient FROM ingredient WHERE nom = 'Œuf' LIMIT 1), 50)
ON DUPLICATE KEY UPDATE quantite = VALUES(quantite);

