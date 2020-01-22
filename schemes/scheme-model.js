const database = require('../db-config');

module.exports = {
    find, 
    findById,
    findSteps,
    add,
    update,
    remove
}

function find() {
    return database('schemes')
    .select()
}

function findById(id) {
    return database("schemes")
    .where({ id })
    .first()
}

function findSteps(schemeId) {
    return database("steps")
        .join("schemes", "schemes.id", "steps.scheme_id")
        .where({scheme_id: schemeId})
        .select("schemes.scheme_name", "steps.step_number", "steps.instructions")
        .orderBy("steps.step_number")
}

async function add(data) {
    const [id] = await database('schemes')
    .insert(data)
    return database('schemes')
    .where({ id })
    .first()
}

function update(change, id) {
    return database('schemes')
    .where({ id })
    .update(change)
}

function remove(id) {
    return database('schemes')
    .where({ id })
    .del()
}