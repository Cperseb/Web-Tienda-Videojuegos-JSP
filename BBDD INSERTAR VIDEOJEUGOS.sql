use tiendavideojuegoscarlospertierra;

INSERT INTO consolas (nombre_consola, potencia_cpu, potencia_gpu, compania, precio, unidades_disponibles)
VALUES
('Xbox One', 1.75, 1.31, 'Microsoft', 249.99, 100),
('Xbox Series X', 3.80, 12.15, 'Microsoft', 499.99, 50),
('Xbox Series S', 3.60, 4.00, 'Microsoft', 299.99, 75),
('Nintendo Switch', 1.02, 0.50, 'Nintendo', 299.99, 200),
('Nintendo Switch Lite', 1.02, 0.50, 'Nintendo', 199.99, 150),
('PS4', 1.60, 1.84, 'Sony', 399.99, 80),
('PS5 con CD', 3.50, 10.28, 'Sony', 499.99, 40),
('PS5 sin CD', 3.50, 10.28, 'Sony', 399.99, 60);

-- Juegos para Xbox One (id_consola = 1)
INSERT INTO juegos (nombre_juego, plataforma, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola)
VALUES
('Halo 5: Guardians', 'Xbox One', '343 Industries', 'FPS', 84.0, 29.99, 50, 1),
('Forza Horizon 3', 'Xbox One', 'Playground Games', 'Carreras', 91.0, 39.99, 30, 1),
('Gears of War 4', 'Xbox One', 'The Coalition', 'Acción', 86.0, 34.99, 40, 1),
('Quantum Break', 'Xbox One', 'Remedy Entertainment', 'Acción/Aventura', 77.0, 24.99, 20, 1),
('Sunset Overdrive', 'Xbox One', 'Insomniac Games', 'Acción', 81.0, 19.99, 25, 1),
('State of Decay 2', 'Xbox One', 'Undead Labs', 'Supervivencia', 68.0, 19.99, 50, 1),
('Sea of Thieves', 'Xbox One', 'Rare', 'Aventura', 67.0, 29.99, 60, 1),
('Ori and the Blind Forest', 'Xbox One', 'Moon Studios', 'Plataformas', 88.0, 14.99, 40, 1),
('ReCore', 'Xbox One', 'Armature Studio', 'Aventura', 63.0, 14.99, 20, 1),
('Crackdown 3', 'Xbox One', 'Sumo Digital', 'Acción', 60.0, 14.99, 15, 1);

-- Juegos para Xbox Series X (id_consola = 2)
INSERT INTO juegos (nombre_juego, plataforma, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola)
VALUES
('Halo Infinite', 'Xbox Series X', '343 Industries', 'FPS', 87.0, 59.99, 50, 2),
('Forza Horizon 5', 'Xbox Series X', 'Playground Games', 'Carreras', 92.0, 59.99, 40, 2),
('Gears Tactics', 'Xbox Series X', 'Splash Damage', 'Estrategia', 82.0, 39.99, 30, 2),
('Flight Simulator', 'Xbox Series X', 'Asobo Studio', 'Simulación', 90.0, 59.99, 20, 2),
('The Medium', 'Xbox Series X', 'Bloober Team', 'Terror', 72.0, 39.99, 20, 2),
('Psychonauts 2', 'Xbox Series X', 'Double Fine', 'Plataformas', 89.0, 49.99, 15, 2),
('Doom Eternal', 'Xbox Series X', 'id Software', 'FPS', 89.0, 49.99, 40, 2),
('FIFA 23', 'Xbox Series X', 'EA Sports', 'Deportes', 82.0, 59.99, 50, 2),
('Assassin’s Creed Valhalla', 'Xbox Series X', 'Ubisoft', 'RPG', 85.0, 59.99, 40, 2),
('Call of Duty: Vanguard', 'Xbox Series X', 'Sledgehammer Games', 'FPS', 74.0, 69.99, 20, 2);

-- Juegos para Xbox Series S (id_consola = 3)
INSERT INTO juegos (nombre_juego, plataforma, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola)
VALUES
('Halo Infinite', 'Xbox Series S', '343 Industries', 'FPS', 87.0, 59.99, 40, 3),
('Forza Horizon 5', 'Xbox Series S', 'Playground Games', 'Carreras', 92.0, 59.99, 35, 3),
('Gears Tactics', 'Xbox Series S', 'Splash Damage', 'Estrategia', 82.0, 39.99, 25, 3),
('Flight Simulator', 'Xbox Series S', 'Asobo Studio', 'Simulación', 90.0, 59.99, 15, 3),
('The Medium', 'Xbox Series S', 'Bloober Team', 'Terror', 72.0, 39.99, 10, 3),
('Psychonauts 2', 'Xbox Series S', 'Double Fine', 'Plataformas', 89.0, 49.99, 20, 3),
('Doom Eternal', 'Xbox Series S', 'id Software', 'FPS', 89.0, 49.99, 30, 3),
('FIFA 23', 'Xbox Series S', 'EA Sports', 'Deportes', 82.0, 59.99, 40, 3),
('Assassin’s Creed Valhalla', 'Xbox Series S', 'Ubisoft', 'RPG', 85.0, 59.99, 30, 3),
('Call of Duty: Vanguard', 'Xbox Series S', 'Sledgehammer Games', 'FPS', 74.0, 69.99, 10, 3);

-- Juegos para Nintendo Switch (id_consola = 4)
INSERT INTO juegos (nombre_juego, plataforma, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola)
VALUES
('The Legend of Zelda: Breath of the Wild', 'Nintendo Switch', 'Nintendo', 'Aventura', 97.0, 59.99, 60, 4), 
('Mario Kart 8 Deluxe', 'Nintendo Switch', 'Nintendo', 'Carreras', 92.0, 59.99, 50, 4),                    
('Super Smash Bros. Ultimate', 'Nintendo Switch', 'Nintendo', 'Lucha', 93.0, 59.99, 45, 4),               
('Animal Crossing: New Horizons', 'Nintendo Switch', 'Nintendo', 'Simulación', 90.0, 59.99, 40, 4),       
('Pokémon Sword/Shield', 'Nintendo Switch', 'Game Freak', 'RPG', 80.0, 59.99, 35, 4),                     
('Splatoon 2', 'Nintendo Switch', 'Nintendo', 'Acción', 83.0, 49.99, 30, 4),
('Fire Emblem: Three Houses', 'Nintendo Switch', 'Intelligent Systems', 'Estrategia', 89.0, 59.99, 25, 4),
('Xenoblade Chronicles 2', 'Nintendo Switch', 'Monolith Soft', 'RPG', 83.0, 59.99, 20, 4),
('Luigi’s Mansion 3', 'Nintendo Switch', 'Next Level Games', 'Aventura', 86.0, 59.99, 40, 4),
('Super Mario Odyssey', 'Nintendo Switch', 'Nintendo', 'Plataformas', 97.0, 59.99, 60, 4);

-- Juegos para Nintendo Switch Lite (id_consola = 5)
INSERT INTO juegos (nombre_juego, plataforma, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola)
VALUES
('The Legend of Zelda: Breath of the Wild', 'Nintendo Switch Lite', 'Nintendo', 'Aventura', 97.0, 59.99, 50, 5), 
('Mario Kart 8 Deluxe', 'Nintendo Switch Lite', 'Nintendo', 'Carreras', 92.0, 59.99, 40, 5),                    
('Super Smash Bros. Ultimate', 'Nintendo Switch Lite', 'Nintendo', 'Lucha', 93.0, 59.99, 30, 5),               
('Animal Crossing: New Horizons', 'Nintendo Switch Lite', 'Nintendo', 'Simulación', 90.0, 59.99, 35, 5),       
('Pokémon Sword/Shield', 'Nintendo Switch Lite', 'Game Freak', 'RPG', 80.0, 59.99, 25, 5),                     
('Octopath Traveler', 'Nintendo Switch Lite', 'Square Enix', 'RPG', 83.0, 49.99, 20, 5),
('Paper Mario: The Origami King', 'Nintendo Switch Lite', 'Nintendo', 'Aventura', 80.0, 49.99, 20, 5),
('Kirby and the Forgotten Land', 'Nintendo Switch Lite', 'Nintendo', 'Plataformas', 85.0, 59.99, 25, 5),
('Bayonetta 2', 'Nintendo Switch Lite', 'PlatinumGames', 'Acción', 92.0, 59.99, 20, 5),
('Yoshi’s Crafted World', 'Nintendo Switch Lite', 'Nintendo', 'Plataformas', 78.0, 49.99, 30, 5);


-- Juegos para PS4 (id_consola = 6)
INSERT INTO juegos (nombre_juego, plataforma, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola)
VALUES
('Uncharted 4: A Thief’s End', 'PS4', 'Naughty Dog', 'Acción/Aventura', 93.0, 19.99, 50, 6),
('The Last of Us Remastered', 'PS4', 'Naughty Dog', 'Acción/Aventura', 95.0, 19.99, 40, 6),
('Bloodborne', 'PS4', 'FromSoftware', 'RPG', 92.0, 19.99, 35, 6),
('God of War', 'PS4', 'Santa Monica Studio', 'Acción/Aventura', 94.0, 39.99, 30, 6),
('Horizon Zero Dawn', 'PS4', 'Guerrilla Games', 'RPG/Aventura', 89.0, 19.99, 40, 6),
('Spider-Man', 'PS4', 'Insomniac Games', 'Acción/Aventura', 87.0, 39.99, 25, 6),
('Persona 5', 'PS4', 'Atlus', 'JRPG', 93.0, 29.99, 20, 6),
('Ghost of Tsushima', 'PS4', 'Sucker Punch', 'Acción/Aventura', 91.0, 39.99, 35, 6),
('Final Fantasy VII Remake', 'PS4', 'Square Enix', 'RPG', 87.0, 49.99, 30, 6),
('Shadow of the Colossus', 'PS4', 'Bluepoint Games', 'Acción/Aventura', 91.0, 29.99, 20, 6);


-- Juegos para PS5 con CD (id_consola = 7)
INSERT INTO juegos (nombre_juego, plataforma, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola)
VALUES
('Demon’s Souls', 'PS5', 'Bluepoint Games', 'RPG', 92.0, 69.99, 30, 7),
('Ratchet & Clank: Rift Apart', 'PS5', 'Insomniac Games', 'Plataformas', 88.0, 69.99, 40, 7),
('Returnal', 'PS5', 'Housemarque', 'Terror/Aventura', 85.0, 69.99, 25, 7),
('Spider-Man: Miles Morales', 'PS5', 'Insomniac Games', 'Acción/Aventura', 85.0, 49.99, 35, 7),
('Gran Turismo 7', 'PS5', 'Polyphony Digital', 'Carreras', 87.0, 69.99, 30, 7), 
('FIFA 23', 'PS5', 'EA Sports', 'Deportes', 82.0, 59.99, 50, 7),               
('Assassin’s Creed Valhalla', 'PS5', 'Ubisoft', 'RPG', 85.0, 59.99, 30, 7),    
('Call of Duty: Vanguard', 'PS5', 'Sledgehammer Games', 'FPS', 74.0, 69.99, 20, 7), 
('Cyberpunk 2077', 'PS5', 'CD Projekt', 'RPG', 86.0, 59.99, 25, 7),            
('The Last of Us Part I', 'PS5', 'Naughty Dog', 'Acción/Aventura', 89.0, 69.99, 15, 7);

-- Juegos para PS5 sin CD (id_consola = 8)
INSERT INTO juegos (nombre_juego, plataforma, compania_desarrolladora, genero, puntuacion_metacritic, precio, unidades_disponibles, id_consola)
VALUES
('Gran Turismo 7', 'PS5', 'Polyphony Digital', 'Carreras', 87.0, 69.99, 25, 8), 
('FIFA 23', 'PS5', 'EA Sports', 'Deportes', 82.0, 59.99, 50, 8),                
('Assassin’s Creed Valhalla', 'PS5', 'Ubisoft', 'RPG', 85.0, 59.99, 30, 8),    
('Call of Duty: Vanguard', 'PS5', 'Sledgehammer Games', 'FPS', 74.0, 69.99, 20, 8), 
('Cyberpunk 2077', 'PS5', 'CD Projekt', 'RPG', 86.0, 59.99, 20, 8),            
('Horizon Forbidden West', 'PS5', 'Guerrilla Games', 'RPG/Aventura', 88.0, 69.99, 15, 8),
('Stray', 'PS5', 'BlueTwelve Studio', 'Aventura', 83.0, 29.99, 30, 8),
('Kena: Bridge of Spirits', 'PS5', 'Ember Lab', 'Aventura', 81.0, 39.99, 25, 8),
('Resident Evil Village', 'PS5', 'Capcom', 'Terror', 84.0, 59.99, 20, 8),
('Dying Light 2', 'PS5', 'Techland', 'Aventura', 77.0, 49.99, 15, 8);


insert into usuarios(nombre_usuario,contrasena,tipo_cuenta)
VALUES
('carlos','123','administrador'),
('cesar','321','cliente');

select * from consolas;