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
    getPics: (req, res) => {
        let plantId = req.body.id
        sequelize.query(`
            SELECT plant_list.name AS plant, plant_list.common_name AS common_name, pictures.link AS link, families.family AS family
            FROM pictures
            JOIN plant_list
            ON pictures.plant_id = plant_list.id
            JOIN families
            ON plant_list.family_id = families.id
            WHERE plant_list.id = ${plantId};
        `).then(dbres => {
            res.status(200).send(dbres)
        }).catch(err => console.log(err));
    },

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
        let { species } = req.params
        console.log('---------')
        console.log(species)
        console.log('---------')
        sequelize.query(`
            SELECT plant_list.name AS Name, common_name, pictures.link AS Picture, families.family AS Family
            FROM plant_list
            JOIN pictures
            ON plant_list.id = pictures.plant_id
            JOIN families
            ON plant_list.family_id = families.id
            WHERE plant_list.name = '${species}';
        `).then(dbRes => {
            console.log(dbRes[0])
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    },

    getCommon: (req, res) => {
        let { common } = req.params
        console.log('---------')
        console.log(common)
        console.log('---------')
        sequelize.query(`
            SELECT plant_list.name AS Name, common_name, pictures.link AS Picture, families.family AS Family
            FROM plant_list
            JOIN pictures
            ON plant_list.id = pictures.plant_id
            JOIN families
            ON plant_list.family_id = families.id
            WHERE plant_list.common_name = '${common}';
        `).then(dbRes => {
            console.log(dbRes[0])
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    },

    getFamily: (req, res) => {
        let { id } = req.params
        console.log('---------')
        console.log(id)
        console.log('---------')
        sequelize.query(`
            SELECT plant_list.name AS Name, common_name, pictures.link AS Picture, families.family AS Family
            FROM plant_list
            JOIN pictures
            ON plant_list.id = pictures.plant_id
            JOIN families
            ON plant_list.family_id = families.id
            WHERE families.family = '${id}';
        `).then(dbRes => {
            console.log(dbRes[0])
            res.status(200).send(dbRes[0])
        }).catch(err => console.log(err))
    }
}