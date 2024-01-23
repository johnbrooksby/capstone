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
    pic_link VARCHAR NOT NULL,
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

INSERT INTO pictures(pic_link, plant_list_id)
VALUES
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_2913(1).JPG', 1), //Pinus eldarica
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_1535.JPG', 2), //Pinus canariensis
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_1738.JPG', 3), //Pinus ponderosa
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/Calendula+officinalis+flower.JPG', 4), //Callendula officinalis
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/pelargonium.png', 5), //Pelargonium x hortorum
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_2914.JPG', 6), //Osteospermum fruticosum
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/Spathiphyllum.jpg', 7), //Spathiphyllum clevelandii
('https://costafarms.com/cdn/shop/files/DSC03638-Edit--cream.jpg?v=1694800191', 8), //Zamioculcas zamiifolia
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_1127.JPG', 9), //Cycas revoluta
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_2354.JPG', 10), //Zamia furfuracea
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_2540.JPG', 11), //Carica papaya
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/0329231809.jpg', 12), //Picea pungens
('https://edsplantshop.com/cdn/shop/products/aglaonema-commutatum-maria-emerald-beauty-990699_1024x1024.jpg?v=1705775095', 13), //Aglaonema commutatum
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_3798.JPG', 14), //Araucaria heterophylla
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_1036.JPG', 15), //Bauhinia purpurea
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_0812.JPG', 15), //Bauhinia purpurea
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/Dracaena+marginata+entire.JPG', 16), //Dracaena marginata
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/Dracaena+draco+stem.JPG', 17), //Dracaena draco
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/Betula+pendula+catkin.JPG', 18), //Betula pendula
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/Betula+pendula+entire.JPG', 18), //Betula pendula
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_0617.JPG', 19), //Caesalpinia cacalaco
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_0615.JPG', 19), //Caesalpinia cacalaco
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/IMG_1242.JPG', 20); //Caesalpinia pulcherrima
