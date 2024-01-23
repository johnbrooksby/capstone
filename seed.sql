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
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419752192_10225173421188158_1545222791199511995_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=a73e89&_nc_ohc=i3ZkxrxwpM8AX9wd9o2&_nc_ht=scontent.fslc3-2.fna&oh=00_AfACuobhK5XTsDnTl-pKkbDREuKHXa-HxFKBmA1c73fIxA&oe=65AAF8D2', 2), //Pinus canariensis
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419728378_10225173422588193_1194817699349442769_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a73e89&_nc_ohc=oTZPprqQv0kAX9ptZ7s&_nc_ht=scontent.fslc3-2.fna&oh=00_AfC9BMAWgeXm0qJeVcNx1XbNOpjJPcT4056ZXoOHF318zA&oe=65AA9ADA', 3), //Pinus ponderosa
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419740823_10225173415428014_5413655735828301492_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a73e89&_nc_ohc=GvRtUpeLhTUAX9i_NLX&_nc_oc=AQlo4646Rrr7ML3vnfzHu0UxVdHLgu5-nMISvH_Ac9yKe_WGq81L48m6V0LsmkUivMU&_nc_ht=scontent.fslc3-2.fna&oh=00_AfCG4Fm0hL--h4BaY8U9lvfJbI1jebiZJpn3nkbdxjAb1g&oe=65AB6AAE', 4), //Callendula officinalis
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419882647_10225173427868325_7597912762163810219_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a73e89&_nc_ohc=gbxLOBTgfmgAX8nguS1&_nc_ht=scontent.fslc3-2.fna&oh=00_AfAkxYuW3fpXgw5P3-NN73itW4nMlgstMgOGLyuYmOO2ww&oe=65A9DC06', 5), //Pelargonium x hortorum
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419746238_10225173425308261_2712334025326814745_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a73e89&_nc_ohc=bemZKzs4YaIAX9azI-L&_nc_ht=scontent.fslc3-2.fna&oh=00_AfDmxR3sYhEZ2-Z1_uSEP10iEzYmjfOqHNOvnrtza7_hrA&oe=65AA9FC8', 6), //Osteospermum fruticosum
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419882102_10225173428668345_5701860877009611585_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a73e89&_nc_ohc=4nC8tplA66UAX9BIF3B&_nc_ht=scontent.fslc3-2.fna&oh=00_AfChrvmThYVsj39I-k8fTeWR6PtOXp54yf2U7DCGwkSYCQ&oe=65A9A788', 7), //Spathiphyllum clevelandii
('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Zamioculcas.jpg/320px-Zamioculcas.jpg', 8), //Zamioculcas zamiifolia
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419877421_10225173421468165_8300550533246738576_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=a73e89&_nc_ohc=fxTNLa_xLLwAX8TfbVV&_nc_ht=scontent.fslc3-2.fna&oh=00_AfAhauUh4LWa3gXoCt5nLDndz2R8G2GsbKe5ge2brApsIA&oe=65AB0ACE', 9), //Cycas revoluta
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419858696_10225173422948202_8607892116430606117_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a73e89&_nc_ohc=1h2jJN1pOogAX8_VIAY&_nc_ht=scontent.fslc3-2.fna&oh=00_AfC95xKXU4pAijWMrRcm8bqIDKKnL5fKZDgt-faD-kTn7w&oe=65AB45B1', 10), //Zamia furfuracea
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419892492_10225173423788223_839222175391796201_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=a73e89&_nc_ohc=CyuTDTMlfkoAX_ZW02Y&_nc_ht=scontent.fslc3-2.fna&oh=00_AfB4SUen7qbyGB_ju4vX48T1mp-hKJaaz2zxYXsZ7Rp5ig&oe=65A9B0DF', 11), //Carica papaya
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/418968148_10225173413427964_2148495091637981133_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a73e89&_nc_ohc=Pp2-qCnv_zsAX9RQZji&_nc_ht=scontent.fslc3-2.fna&oh=00_AfDjYq7UEdRfWjIZRxyzwDXAWx2fNwnVVJxRZmtvt5-h_g&oe=65AAE499', 12), //Picea pungens
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419640863_10225173062579193_7139652068587813101_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a73e89&_nc_ohc=hSbl_iEgGfkAX_qCHTd&_nc_oc=AQkegEDwHT-zs3635aX_dv590XQvLtiBCgIbVrF13mExzaw9lw8Lx9LuMuqS-RnzEqw&_nc_ht=scontent.fslc3-2.fna&oh=00_AfDBN-bR1VTpHWPeI6dorMcLOboMOBBelGUzP_mnBrmO9w&oe=65A9C38C', 13), //Aglaonema commutatum
('https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/419748783_10225173426548292_6247986448640375196_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=a73e89&_nc_ohc=ai0F2y7cBXcAX_99JtM&_nc_ht=scontent-sjc3-1.xx&oh=00_AfDvd5ZXByr_45d_bf6h_dmdQBvagjkxAG-3qF3lvk2GIw&oe=65A9F752', 14), //Araucaria heterophylla
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419757658_10225173419348112_7885766454504607547_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a73e89&_nc_ohc=iqcDj60sl8oAX8fl86I&_nc_ht=scontent.fslc3-2.fna&oh=00_AfABe39cd9_9bA5lotPQHcHaF_lJPnWDMddrbCdh5ywlzg&oe=65ABCFE1', 15), //Bauhinia purpurea
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419748997_10225173419908126_8336671621479599028_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a73e89&_nc_ohc=op9K5Hj9MOoAX-gFj2J&_nc_ht=scontent.fslc3-2.fna&oh=00_AfDvhs43HrOTGfJ-WoPp9-JgoV2Liiv_ROGpuf67pUx7PA&oe=65AA45CA', 15), //Bauhinia purpurea
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419934180_10225177279644617_1201872910871148906_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=a73e89&_nc_ohc=9JXkIl2y4ToAX_wpFsp&_nc_oc=AQnIo4B7E4NvnXlvPfdqiHGjSqq6FCTeTC_-lMRYx2AOgeKCmLCV5G5qUqp93-kPaTI&_nc_ht=scontent.fslc3-2.fna&oh=00_AfCDpIOfQcmEd1dW85fYuwQi3uey5PS9PKOhIFg4pjpG4w&oe=65AB458B', 16), //Dracaena marginata
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419615713_10225177274044477_9134970815768899490_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a73e89&_nc_ohc=6sn4rUGVpQgAX_ve2gt&_nc_ht=scontent.fslc3-2.fna&oh=00_AfB6MsK-c4kTNvPdbH2AN52aWSMQzASUdx3koWzneDkhLA&oe=65AB8F62', 17), //Dracaena draco
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/Betula+pendula+catkin.JPG', 18), //Betula pendula
('https://myplantpictures.s3.us-west-1.amazonaws.com/plants/Betula+pendula+entire.JPG', 18), //Betula pendula
('https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/419850127_10225173419548117_3089197305011170806_n.jpg?stp=dst-jpg_p480x480&_nc_cat=107&ccb=1-7&_nc_sid=a73e89&_nc_ohc=b43k8Vu_5ugAX_AQfgu&_nc_ht=scontent-sjc3-1.xx&oh=00_AfCinQ9KTxfLkqo2W990VsZ6lwkbKZPwOhiRpi0Ae6X1Ig&oe=65A8FD97', 19), //Caesalpinia cacalaco
('https://scontent.fslc3-2.fna.fbcdn.net/v/t39.30808-6/419760068_10225173417268060_4449006516610681912_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a73e89&_nc_ohc=Y1--EHPVOgIAX_5AFJo&_nc_ht=scontent.fslc3-2.fna&oh=00_AfDvOGTS7btXNREwcfih2JcgFOE_BSn5037fX_sKmkEkVQ&oe=65AA5670', 19), //Caesalpinia cacalaco
('https://scontent-sjc3-1.xx.fbcdn.net/v/t39.30808-6/419748796_10225173421668170_7260922937737562245_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a73e89&_nc_ohc=UYS20KnJKukAX-utTIF&_nc_ht=scontent-sjc3-1.xx&oh=00_AfAcC-z9qo7b_NMu3nnb4dkpajS7WZQXr1U_TsO22KrDOg&oe=65AA3731', 20); //Caesalpinia pulcherrima
