-- CREATE TABLE plant_type(
--     id SERIAL PRIMARY KEY,
--     type VARCHAR NOT NULL
-- );

-- CREATE TABLE families (
--     id SERIAL PRIMARY KEY,
--     family VARCHAR NOT NULL
-- );

-- CREATE TABLE plant_list (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR NOT NULL,
--     plant_type_id INTEGER REFERENCES plant_type(id),
--     family_id INTEGER REFERENCES families(id)
-- );

-- CREATE TABLE pictures (
--     id SERIAL PRIMARY KEY,
--     link VARCHAR NOT NULL,
--     plant_id INTEGER REFERENCES plant_list(id)
-- );

-- INSERT INTO plant_type (type)
-- VALUES('Deciduous'),
-- ('Evergreen'),
-- ('Flower'),
-- ('Houseplant');

INSERT INTO families(family)
VALUES
--1 ('Pinaceae')
--2 ('Asteraceae'),
--3 ('Geraniaceae'),
--4 ('Araceae'),
--5 ('Cycadaceae'),
--6 ('Caricaceae'),
--7 ('Araucariaceae'),
--8 ('Fabaceae');
--9 ('Asparagaceae'),
--10 ('Betulaceae');

INSERT INTO plant_list(name, common_name, plant_type_id, family_id)
VALUES
--1 ('Pinus eldarica', 'Afghan Pine', 2, 1),
--2 ('Pinus canariensis', 'Canary Island Pine', 2, 1),
--3 ('Pinus ponderosa', ' Ponderosa Pine', 2, 1),
--4 ('Callendula officinalis', 'Callendula', 3, 2),
--5 ('Pelargonium x hortorum', 'Geranium', 3, 3),
--6 ('Osteospermum fruticosum', 'African Daisy', 3, 2),
--7 ('Spathiphyllum clevelandii', 'Peace Lily', 4, 4),
--8 ('Zamioculcas zamiifolia', 'ZZ Plant', 4, 4),
--9 ('Cycas revoluta', 'Sago Palm', 2, 5),
--10 ('Zamia furfuracea', 'Cardboard Palm', 2, 5),
--11 ('Carica papaya', 'Papaya', 2, 6),
--12 ('Picea pungens', 'Colorado Spruce', 2, 1),
--13 ('Aglaonema commutatum', 'Chinese Evergreen', 4, 4),
--14 ('Araucaria heterophylla', 'Norfolk Island Pine', 4, 7),
--15 ('Bauhinia purpurea', 'Orchid Tree', 1, 8);
--16 ('Dracaena marginata', 'Dracaena', 4, 9),
--17 ('Dracaena draco', 'Dragon Tree', 2, 9),
--18 ('Betula pendula', 'Weeping Birch', 1, 10),
--19 ('Caesalpinia cacalaco', 'Cascalota', 2, 8),
--20 ('Caesalpinia pulcherrima', 'Red Bird of Paradise', 2, 8);

INSERT INTO pictures(link, plant_id)
VALUES
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraOWpleWMzYjdwbm8', 1),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTurabFVLRDZZb2IxQkE', 1),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraenozLUtnTXQwZlk', 2),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraR0Nfb0c3UmJmWWs', 3),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraYnVmYXZyMHIydUU', 3),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTurad1ZFdDE2Vno4RWs', 4),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraRURkeEt0YlZSTm8', 5),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraR0d2MHNyY2ZVTEU', 6),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraaFY1V3BSaUZFeTA', 7),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraRmpoMXJ5c3FVbkk', 9),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraajNEZTlhRHhBNG8', 10),
-- ('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraWUl1T2hBa3cxUjA', 11);

