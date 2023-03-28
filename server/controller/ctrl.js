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
    getpics: (req, res) => {
        let plantId = req.body.id
        sequelize.query(`
            SELECT plant_list.name AS plant, plant_list.common_name AS common_name, pictures.link AS link, families.family AS Family
            FROM pictures
            JOIN plant_list
            ON pictures.plant_id = plant_list.id
            JOIN families
            ON plant_list.family_id = families.id
            WHERE plant_list.id = 5;
        `).then(dbres => {
            res.status(200).send(dbres)
        }).catch(err => console.log(err));
    },

    filterFam: (req, res) => {
        let filter = req.body
    }
}