-- Schéma de la base de données Tifosi

USE tifosi;

-- Table marque
CREATE TABLE marque (
  id_marque INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  UNIQUE KEY uq_marque_nom (nom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table boisson
CREATE TABLE boisson (
  id_boisson INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(150) NOT NULL,
  prix DECIMAL(7,2) NOT NULL DEFAULT 0.00,
  id_marque INT NOT NULL,
  UNIQUE KEY uq_boisson_nom (nom),
  INDEX idx_boisson_marque (id_marque),
  CONSTRAINT fk_boisson_marque FOREIGN KEY (id_marque) REFERENCES marque(id_marque) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table ingredient
CREATE TABLE ingredient (
  id_ingredient INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(120) NOT NULL,
  UNIQUE KEY uq_ingredient_nom (nom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table focaccia
CREATE TABLE focaccia (
  id_focaccia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(150) NOT NULL,
  prix DECIMAL(7,2) NOT NULL DEFAULT 0.00,
  UNIQUE KEY uq_focaccia_nom (nom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table focaccia_ingredient 
CREATE TABLE focaccia_ingredient (
  id_focacia_ing INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_focaccia INT NOT NULL,
  id_ingredient INT NOT NULL,
  quantite INT NOT NULL DEFAULT 0,
  CONSTRAINT uq_foc_ing UNIQUE (id_focaccia, id_ingredient),
  INDEX idx_focaccia (id_focaccia),
  INDEX idx_ingredient (id_ingredient),
  CONSTRAINT fk_foc_ing_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_foc_ing_ingredient FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table menu 
CREATE TABLE menu (
  id_menu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(150) NOT NULL,
  prix DECIMAL(7,2) NOT NULL DEFAULT 0.00,
  UNIQUE KEY uq_menu_nom (nom)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table menu_focaccia 
CREATE TABLE menu_focaccia (
  id_menu_foc INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_menu INT NOT NULL,
  id_focaccia INT NOT NULL,
  quantite INT NOT NULL DEFAULT 1,
  CONSTRAINT uq_menu_foc UNIQUE (id_menu, id_focaccia),
  INDEX idx_menu (id_menu),
  INDEX idx_menu_focaccia (id_focaccia),
  CONSTRAINT fk_menu_foc_menu FOREIGN KEY (id_menu) REFERENCES menu(id_menu) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_menu_foc_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table client
CREATE TABLE client (
  id_client INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(100) NOT NULL,
  email VARCHAR(255) DEFAULT NULL,
  code_postal VARCHAR(20) DEFAULT NULL,
  UNIQUE KEY uq_client_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Table achat 
CREATE TABLE achat (
  id_achat INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_client INT NOT NULL,
  id_boisson INT DEFAULT NULL,
  id_focaccia INT DEFAULT NULL,
  quantite INT NOT NULL DEFAULT 1,
  date_achat DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_achat_client (id_client),
  INDEX idx_achat_boisson (id_boisson),
  INDEX idx_achat_focaccia (id_focaccia),
  CONSTRAINT fk_achat_client FOREIGN KEY (id_client) REFERENCES client(id_client) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_achat_boisson FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_achat_focaccia FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT chk_achat_item CHECK (id_boisson IS NOT NULL OR id_focaccia IS NOT NULL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;