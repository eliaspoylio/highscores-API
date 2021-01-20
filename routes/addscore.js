const express = require('express')
const router = express.Router()
const Score = require('../models/score')

const middleware = require('../middleware')

router.post('/score', middleware.verify, (req, res) => {
    const newScore = Score({ email: req.body.email, score: req.body.score })
    newScore.save(function (err) {
        if (err) res.status(500).json(error)
    })
    res.status(200).json({ email: req.body.email, score: req.body.score, status: 'added to db' })
})

module.exports = router