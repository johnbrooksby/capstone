CREATE TABLE plant_type(
    id SERIAL PRIMARY KEY,
    type VARCHAR NOT NULL
);

CREATE TABLE families (
    id SERIAL PRIMARY KEY,
    family VARCHAR NOT NULL UNIQUE
);

CREATE TABLE plant_list (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE,
    common_name VARCHAR NOT NULL,
    plant_type_id INTEGER REFERENCES plant_type(id),
    family_id INTEGER REFERENCES families(id)
);

CREATE TABLE pictures (
    id SERIAL PRIMARY KEY,
    link VARCHAR NOT NULL,
    plant_list_id INTEGER REFERENCES plant_list(id)
);


INSERT INTO plant_type (type)
VALUES('Deciduous'),
('Evergreen'),
('Flower'),
('Houseplant');

INSERT INTO families(family)
VALUES
('Pinaceae'),
('Asteraceae'),
('Geraniaceae'),
('Araceae'),
('Cycadaceae'),
('Caricaceae'),
('Araucariaceae'),
('Fabaceae'),
('Asparagaceae'),
('Betulaceae');

INSERT INTO plant_list(name, common_name, plant_type_id, family_id)
VALUES
('Pinus eldarica', 'Afghan Pine', 2, 1),
('Pinus canariensis', 'Canary Island Pine', 2, 1),
('Pinus ponderosa', 'Ponderosa Pine', 2, 1),
('Callendula officinalis', 'Callendula', 3, 2),
('Pelargonium x hortorum', 'Geranium', 3, 3),
('Osteospermum fruticosum', 'African Daisy', 3, 2),
('Spathiphyllum clevelandii', 'Peace Lily', 4, 4),
('Zamioculcas zamiifolia', 'ZZ Plant', 4, 4),
('Cycas revoluta', 'Sago Palm', 2, 5),
('Zamia furfuracea', 'Cardboard Palm', 2, 5),
('Carica papaya', 'Papaya', 2, 6),
('Picea pungens', 'Colorado Spruce', 2, 1),
('Aglaonema commutatum', 'Chinese Evergreen', 4, 4),
('Araucaria heterophylla', 'Norfolk Island Pine', 4, 7),
('Bauhinia purpurea', 'Orchid Tree', 1, 8),
('Dracaena marginata', 'Dracaena', 4, 9),
('Dracaena draco', 'Dragon Tree', 2, 9),
('Betula pendula', 'Weeping Birch', 1, 10),
('Caesalpinia cacalaco', 'Cascalota', 2, 8),
('Caesalpinia pulcherrima', 'Red Bird of Paradise', 2, 8);

INSERT INTO pictures(link, plant_list_id)
VALUES
('https://drive.google.com/uc?export=view&id=1YSbQfhDoX7M5-t5_-JnmHrpNinI3GQve', 1),
('https://drive.google.com/uc?export=view&id=1ReDIRUmYWlcmK8Wb0aygk5iceWvCnvg_', 1),
('https://drive.google.com/uc?export=view&id=1Iw1oLcsruvHl2wHthsvzmfWc7J7TPDGe', 2),
('https://drive.google.com/uc?export=view&id=1a88NP6hGM5R5KSsWNw_DredXa1QhnQqE', 3),
('https://drive.google.com/uc?export=view&id=1DieNg6CsKJEYpmxNVmeoprj3i5R7MvDZ', 3),
('https://drive.google.com/uc?export=view&id=1ERkfTxpswKSD_MjaSOY0hAxGYSWT5Yu0', 4),
('https://drive.google.com/uc?export=view&id=1pssS_orAIau46FYUHNfet0w24EwWjSEx', 5),
('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraR0d2MHNyY2ZVTEU', 6),
('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraaFY1V3BSaUZFeTA', 7),
('https://drive.google.com/uc?export=view&id=1aFLQUKsTd1DrhxLxRnFAy-XHJGzopf-K', 9),
('https://drive.google.com/uc?export=view&id=1iskrnkmTjENrDn5OwZwGvRvGqk0QEypL', 10),
('https://drive.google.com/uc?export=view&id=0B5bH67yjTuraWUl1T2hBa3cxUjA', 11),
('https://drive.google.com/uc?export=view&id=1y6pfnYZmDYdFnfInEfhHO6lWys8iGa4_', 12),
('https://drive.google.com/uc?export=view&id=1UkaNCA44MiFGncuA8EhGIpOe4NokbXln', 13),
('https://drive.google.com/uc?export=view&id=1D8-yRkg9ycVVjcKxiAooxm3VBDWUEniQ', 14),
('https://drive.google.com/uc?export=view&id=13bN245mvbwFMPQN8VArHQOImPtDAqARK', 15),
('https://drive.google.com/uc?export=view&id=1SFmhWBkD3CFJJcnVmOPgC6IavGrCeqcb', 16),
('https://drive.google.com/uc?export=view&id=1YhPYY_xS0x-4MsDL2CXWPmx9oQKrwvZE', 17),
('https://drive.google.com/uc?export=view&id=13pqSMI24siIKh8y8K1AO7QbsVgN8K0e2', 18),
('https://drive.google.com/uc?export=view&id=1sGnysBmWEmRXz0d5uSc_qEI02OUl3wC0', 18),
('https://drive.google.com/uc?export=view&id=10CiRd-FqB-_oZJxYNT3A2KDzXKYutGja', 19),
('https://drive.google.com/uc?export=view&id=1j1VQKaWGjyXXHdXVo60ExKbz1kRxVPQG', 19),
('https://drive.google.com/uc?export=view&id=1SseTo0F8yE0jh5TX_s-pHJHPHFs66CJO', 20);
