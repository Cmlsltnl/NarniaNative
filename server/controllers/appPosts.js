var connection = require('../../db/index.js');

module.exports = {
  dummyUser: function(req, res, next) {
    // var user1 = {
    //   name: 'Jonathan',
    //   email: 'MrJonWu@gmail.com',
    //   token: '12345678910',
    //   username: 'MrJonWu',
    //   password: 'password',
    //   thumbnail: 'https://avatars1.githubusercontent.com/u/21250622?v=3&s=460'
    // };
    // var user2 = {
    //   name: 'Haris',
    //   email: 'haris@haris.com',
    //   token: '12345678910',
    //   username: 'Haris',
    //   password: 'password',
    //   thumbnail: 'https://avatars2.githubusercontent.com/u/19330576?v=3&s=460'
    // };
    // var user3 = {
    //   name: 'Rick',
    //   email: 'Rick@rick.com',
    //   token: '12345678910',
    //   username: 'Rick',
    //   password: 'password',
    //   thumbnail: 'https://avatars0.githubusercontent.com/u/20013587?v=3&s=460'
    // };
    var user4 = {
      name: 'Zach',
      email: 'Zach@zach.com',
      token: '12345678910',
      username: 'Zach',
      password: 'password',
      thumbnail: 'https://avatars3.githubusercontent.com/u/14946412?v=3&s=460'
    };

    // connection.query('INSERT INTO users SET ?', user1, function(err, result) {
    //   var response = err || result;
    //   res.json(response);
    // });
    // connection.query('INSERT INTO users SET ?', user2, function(err, result) {
    //   var response = err || result;
    //   res.json(response);
    // });
    // connection.query('INSERT INTO users SET ?', user3, function(err, result) {
    //   var response = err || result;
    //   res.json(response);
    // });
    connection.query('INSERT INTO users SET ?', user4, function(err, result) {
      var response = err || result;
      res.json(response);
    });
  },

  deletePost: function(req, res, next) {
    connection.query('DELETE FROM posts where posts.id=5', function(err, result) {
      var response = err || result;
      res.json(response);
    });
  },

  postToDb: function(req, res, next) {
    console.log('hit')
    console.log(req.body)
    // var time = new Date();
    // var post = {
    //   postId: 0,
    //   userId: 3,
    //   likesCount: 0,
    //   body: 'http://funnycatsgif.com/wp-content/uploads/2015/04/cat-images-funny-picture.jpg',
    //   description: 'this should be a new post from Rick.',
    //   type: 'image',
    //   createdAt: time
    // };
    // var comment = {
    //   postId: 1,
    //   userId: 4,
    //   likesCount: 0,
    //   body: 'blah!',
    //   description: 'null',
    //   type: 'comment',
    //   createdAt: time
    // };
    connection.query('INSERT INTO posts SET ?', req.body, function(err, result) {
      var response = err || result;
      console.log('made it here', response)
      res.json(response);
    });
  },
  getPostsFromDb: function(req, res, next) {
    connection.query('SELECT posts.userId, users.username, users.thumbnail, posts.id, posts.body, posts.description, posts.likesCount, posts.type, posts.createdAt FROM users INNER JOIN posts on users.id=posts.userId and posts.type="image" ORDER BY likesCount DESC', function(err, result) {
      var response = err || result;
      res.json(response);
    });
  },
  getCommentsFromDb: function(req, res, next) {
    connection.query('SELECT posts.userId, users.username, users.thumbnail, posts.id, posts.postId, posts.body, posts.description, posts.likesCount, posts.type, posts.createdAt FROM users INNER JOIN posts on users.id=posts.userId and posts.type="comment" and posts.postId =' + req.body.id, function(err, result) {
      var response = err || result;
      res.json(response);
    });
  },
  increaseLikeCount: function(req, res, next) {
    connection.query('UPDATE posts SET likesCount = likesCount + 1 WHERE id = ' + req.body.id, function(err, result) {
      var response = err || result;
      res.json(response);
    });
  },
  decreaseLikeCount: function(req, res, next) {
    connection.query('UPDATE posts SET likesCount = likesCount - 1 WHERE id = ' + req.body.id, function(err, result) {
      var response = err || result;
      res.json(response);
    });
  },
};
