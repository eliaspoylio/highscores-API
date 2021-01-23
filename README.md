# Highscores API

API for adding highscores to MongoDB with user authentication.

```
----------                  ----------                  ----------
| Client | -- GET login --> | Server |                  |   DB   |
|        |                  |        |                  |        |
|        | <- res token --  |        |                  |        |
|        |                  |        |                  |        |
|        | -- POST score -> |        | -- add to db ->  |        |
|        |    ( token )     |        |                  |        |
|        |                  |        |                  |        |
|        | <- res "OK!"  -- |        |                  |        |
|        |                  |        |                  |        |
----------                  ----------                  ----------
```


## Dependencies

- bcrypt
- express
- jsonwebtoken
- mongodb
- mongoose

## MongoDB PowerShell cheatsheet

Start the database
```
.\mongod
```

Start mongo shell
```
.\mongo
```

Display HighScores collection
```
db.scores.find()
```

## TODO

- separating databases
