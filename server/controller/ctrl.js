require('dotenv').config();
const { CONNECTION_STRING } = process.env;
const Sequelize = require('sequelize');
const sequelize = new Sequelize(CONNECTION_STRING, {
    dialect: 'postgres',
    dialectOptions: {
        ssl: {
            rejectUnauthorized: false
        }
    }
})

module.exports = {
    filterFam: (req, res) => {
        sequelize.query(`
            SELECT *
            FROM families
            ORDER BY family;
        `).then(dbRes => {
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    },
    
    getSpecies: (req, res) => {
        const { species } = req.params
        sequelize.query(`
            SELECT plant_list.name AS Name, plant_list.common_name AS common_name, pictures.pic_link AS Picture, families.family AS Family
            FROM plant_list
            JOIN pictures
            ON plant_list.id = pictures.plant_list_id
            JOIN families
            ON plant_list.family_id = families.id
            WHERE plant_list.name = '${species}'
            ORDER BY name DESC;
        `).then(dbRes => {
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    },

    getCommon: (req, res) => {
        const { common } = req.params
        sequelize.query(`
            SELECT plant_list.name AS Name, plant_list.common_name AS common_name, pictures.pic_link AS Picture, families.family AS Family
            FROM plant_list
            JOIN pictures
            ON plant_list.id = pictures.plant_list_id
            JOIN families
            ON plant_list.family_id = families.id
            WHERE plant_list.common_name = :common
            ORDER BY name;
        `,
        {
            replacements: {
                common: common
            }
        }).then(dbRes => {
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    },

    getFamily: (req, res) => {
        const { id } = req.params
        
        sequelize.query(`
            SELECT plant_list.name AS Name, plant_list.common_name AS common_name, pictures.pic_link AS Picture, families.family AS Family
            FROM plant_list
            JOIN pictures
            ON plant_list.id = pictures.plant_list_id
            JOIN families
            ON plant_list.family_id = families.id
            WHERE families.family = :id
            ORDER BY name;
        `,
        {
            replacements: {
                id: id
            }
        }).then(dbRes => {
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    },

    addNewFam: (req, res) => {
        const { family } = req.body;
        sequelize.query(`
            INSERT INTO families (family)
            VALUES(:family);
        `,
        {
            replacements: {
                family: family
            }
        }).then(dbRes => {
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
        
    },
    
    addNewSpecies: (req, res) => {
        const { name, common_name, plant_type_id, family_id } = req.body;
        
        sequelize.query(`
            INSERT INTO plant_list(name, plant_type_id, family_id, common_name)
            VALUES(:name, :plant_type_id, :family_id, :common_name);
            `,
            {
                replacements: {
                    name: name,
                    plant_type_id: plant_type_id,
                    family_id: family_id,
                    common_name: common_name
                }
            }).then(dbRes => {
                res.status(200).send(dbRes[0])
            }).catch(err => console.log(err));
    },

    updatedSpeciesList: (req, res) => {
        sequelize.query(`
            SELECT name, id
            FROM plant_list;
        `).then(dbRes => {
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    },
        
    addNewImage: (req, res) => {
        const { link, plant_list_id } = req.body;
        sequelize.query(`
            INSERT INTO pictures (pic_link, plant_list_id)
            VALUES (:pic_link, :plant_list_id);
        `,
        {
            replacements: {
                pic_link: link,
                plant_list_id: plant_list_id                
            }
        }).then(dbRes => {
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    },

    type: (req, res) => {
        const { id } = req.params
        sequelize.query(`
            SELECT plant_list.name AS Name, plant_list.common_name AS common_name, pictures.pic_link AS Picture, plant_type.type AS type
            FROM plant_list
            JOIN pictures
            ON plant_list.id = pictures.plant_list_id
            JOIN plant_type
            ON plant_type.id = plant_list.plant_type_id
            WHERE plant_type.type = :id
            ORDER BY name;
        `,
        {
            replacements: {
                id: id
            }
        }).then(dbRes => {
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    }
}