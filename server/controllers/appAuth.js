var connection = require('../../db/index.js');
require('dotenv').config();
var dbUser = require('./appUsers');

module.exports = {

  // Originally written for desktop - possibly should be deleted
  login: function(req, res, next) {
    var username = req.body.username;
    var password = req.body.password;

    connection.query({
      sql: 'SELECT * FROM `users` WHERE `username` = ?',
      timeout: 40000,
      values: [username]
    },
    function(err, result) {
      if (result.length > 0 && result[0].password === password) {
        res.json('you can log in!');
      } else {
        res.json('invalid username or password please try again');
      }
    });
  },

  // Originally written for desktop - possibly should be deleted
  signup: function(req, res, next) {
    connection.query({
      sql: 'SELECT * FROM `users` WHERE `username` = ?',
      timeout: 40000,
      values: [req.body.username]
    },
    function(err, result) {
      if (result.length > 0) {
        res.json('user exists already');
      } else {
        var time = new Date();
        var newUser = {
          name: null,
          email: null,
          username: req.body.username,
          password: req.body.password,
          createdAt: time,
          updatedAt: time
        };
        connection.query('INSERT INTO users SET ?', newUser, function(err, result) {
          var response = err || result;
          res.json(response);
        });
      }
    });
  },

  mobileFbLogin: function(req, res, next) {
    var body = JSON.parse(req.body._bodyText);
    var token = req.body.url.slice(43);
    connection.query({
      sql: 'SELECT * FROM `users` WHERE `username` = ?',
      timeout: 40000,
      values: [body.id]
    },
    function(err, result) {
      if (result.length > 0) {
        console.log('user exists already');
      } else {
        var time = new Date();
        var newUser = {
          name: body.name,
          email: null,
          token: token,
          username: body.id,
          password: null,
          createdAt: time,
          updatedAt: time
        };
        connection.query('INSERT INTO users SET ?', newUser, function(err, result) {
          var response = err || result;
        });
      }
    });
  },

  // SHOULD BE REMOVED ONCE TEST IS REWRITTEN TO US mbLogin
  findUser: function(req, res, next) {
    if (!req.body.username) {
      res.send('no username provided');
      return;
    }
    return dbUser.getUser(req.body.username)
    .then(function(result) {
      res.json(result);
    });
  },

  mbLogin: function(req, res, next) {
    if (!req.body.username || !req.body.password) {
      res.send('no username or password provided');
      return;
    }
    return dbUser.getUser(req.body.username)
    .then(function(result) {
      if (Array.isArray(result) && result.length > 0) {
        if (req.body.password === result[0].password) {
          res.json({// NEED TO GIVE TOKEN AT THIS POINT
            token: 'token',
            id: result[0].id
          });
        } else {
          res.send('Invalid username or password.');
        }
      } else {
        res.send('Invalid username or password.');
      }
    });
  },

  createUser: function(req, res, next) {
    if (!req.body.username) {
      res.json('no user information');
      return;
    }
    var time = new Date();
    var newUser = {
      name: req.body.name || null,
      email: req.body.email || null,
      token: req.body.token || null,
      username: req.body.username || null,
      password: req.body.password || null,
      thumbnail: req.body.thumbnail || null,
      createdAt: req.body.createdAt || time,
      updatedAt: req.body.updatedAt || time
    };
    return dbUser.getUser(newUser.username)
    .then(function(response) {
      if (response.length === 0) {
        return dbUser.setUser(newUser)
        .then(function(result) { // NEED TO GIVE TOKEN AT THIS POINT
          res.json({
            token: 'token',
            id: result.insertId
          });
        });
      } else {
        res.send('User already exists.');
      }
    });
  },

  removeUser: function(req, res, next) {
    if (!req.body.username) {
      res.json('no user information');
    }
    return dbUser.deleteUser(req.body.username)
    .then(function(response) {
      res.json(response);
    });
  },

  test: function(req, res, next) {
    res.json('success');
  }
};