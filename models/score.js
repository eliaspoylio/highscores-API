const mongoose = require('mongoose')

const model = mongoose.Schema({
    email: {
        type: String,
        required: true
    },
    score: {
        type: Number,
        min: [0, 'Under min value'],
        max: [999999, 'Max value exceeded'],
      },
});

module.exports = new mongoose.model("Score", model)