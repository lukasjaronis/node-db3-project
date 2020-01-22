const database = require('../db-config');

module.exports = {
    find, 
    // findByID,
    // findSteps,
    // add,
    // update,
    // remove
}

function find() {
    return database('schemes')
    .select()
}