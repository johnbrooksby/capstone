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
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419897615_10225173424508241_4525288511236713019_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=a73e89&_nc_ohc=PHGXI9sfXD0AX-MjeAT&_nc_ht=scontent.fslc3-2.fna&oh=00_AfDChFBA8BKuV4_WxlETHTg_I76TdHupiyG9X6_LvzcTBw&oe=65AAA562', 1), //Pinus eldarica
('https://drive.google.com/uc?export=view&id=1Iw1oLcsruvHl2wHthsvzmfWc7J7TPDGe', 2), //Pinus canariensis
('https://drive.google.com/uc?export=view&id=1a88NP6hGM5R5KSsWNw_DredXa1QhnQqE', 3), //Pinus ponderosa
('https://drive.google.com/uc?export=view&id=1DieNg6CsKJEYpmxNVmeoprj3i5R7MvDZ', 3), //Pinus ponderosa
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419740823_10225173415428014_5413655735828301492_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a73e89&_nc_ohc=GvRtUpeLhTUAX9i_NLX&_nc_oc=AQlo4646Rrr7ML3vnfzHu0UxVdHLgu5-nMISvH_Ac9yKe_WGq81L48m6V0LsmkUivMU&_nc_ht=scontent.fslc3-2.fna&oh=00_AfCG4Fm0hL--h4BaY8U9lvfJbI1jebiZJpn3nkbdxjAb1g&oe=65AB6AAE', 4), //Callendula officinalis
('https://drive.google.com/uc?export=view&id=1pssS_orAIau46FYUHNfet0w24EwWjSEx', 5), //Pelargonium x hortorum
('https://drive.google.com/uc?export=view&id=1XriEu8EfNI5O95VN6TcShqHdiExH839X', 6), //Osteospermum fruticosum
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419882102_10225173428668345_5701860877009611585_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a73e89&_nc_ohc=4nC8tplA66UAX9BIF3B&_nc_ht=scontent.fslc3-2.fna&oh=00_AfChrvmThYVsj39I-k8fTeWR6PtOXp54yf2U7DCGwkSYCQ&oe=65A9A788', 7), //Spathiphyllum clevelandii
('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Zamioculcas.jpg/320px-Zamioculcas.jpg', 8), //Zamioculcas zamiifolia
('https://drive.google.com/uc?export=view&id=1aFLQUKsTd1DrhxLxRnFAy-XHJGzopf-K', 9), //Cycas revoluta
('https://drive.google.com/uc?export=view&id=1iskrnkmTjENrDn5OwZwGvRvGqk0QEypL', 10), //Zamia furfuracea
('https://drive.google.com/uc?export=view&id=1bxXtgzJ1IfKbJ0WrzmRTVkBxpFJsYtmq', 11), //Carica papaya
('https://drive.google.com/uc?export=view&id=1y6pfnYZmDYdFnfInEfhHO6lWys8iGa4_', 12), //Picea pungens
('https://drive.google.com/uc?export=view&id=1UkaNCA44MiFGncuA8EhGIpOe4NokbXln', 13), //Aglaonema commutatum
('https://drive.google.com/uc?export=view&id=1D8-yRkg9ycVVjcKxiAooxm3VBDWUEniQ', 14), //Araucaria heterophylla
('https://drive.google.com/uc?export=view&id=13bN245mvbwFMPQN8VArHQOImPtDAqARK', 15), //Bauhinia purpurea
('https://drive.google.com/uc?export=view&id=1SFmhWBkD3CFJJcnVmOPgC6IavGrCeqcb', 16), //Dracaena marginata
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419876580_10225173417468065_372835570550122619_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=a73e89&_nc_ohc=kOAp0fVpq5cAX9-S_xX&_nc_ht=scontent.fslc3-2.fna&oh=00_AfATuWK-8TjKObiRqOFG5WQvE1EhP5SQtzF507sovb1OmQ&oe=65AA0CA9', 17), //Dracaena draco
('https://drive.google.com/uc?export=view&id=13pqSMI24siIKh8y8K1AO7QbsVgN8K0e2', 18), //Betula pendula
('https://drive.google.com/uc?export=view&id=1sGnysBmWEmRXz0d5uSc_qEI02OUl3wC0', 18), //Betula pendula
('https://drive.google.com/uc?export=view&id=10CiRd-FqB-_oZJxYNT3A2KDzXKYutGja', 19), //Caesalpinia cacalaco
('https://drive.google.com/uc?export=view&id=1j1VQKaWGjyXXHdXVo60ExKbz1kRxVPQG', 19), //Caesalpinia cacalaco
('https://drive.google.com/uc?export=view&id=1SseTo0F8yE0jh5TX_s-pHJHPHFs66CJO', 20); //Caesalpinia pulcherrima
