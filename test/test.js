var expect = require('chai').expect;
var server = require('../server/server.js');
var supertest = require('supertest');

var request = supertest.agent(server);
var connection = require('../db/index.js');



describe('server should', function() {
  // describe('POST from /api/users/mobileFbLogin and', function () {
  //   it('store a new user in the users table', function (done) {
  //     request
  //     .post('/api/users/mobileFbLogin')
  //     .expect(200, /<input/, done);
  //   });
  // });
  describe('GET from /api/test', function () {
    it('returns "success"', function (done) {
      request
      .get('/api/test')
      .expect('"success"', done);
    });
  });

  // describe('POST from /api/createDummy and', function() {
  //   it('return response', function(done) {
  //     request.post('/api/createDummy');
  //     // .expect('response', null, done);
  //     connection.query({
  //       sql: 'SELECT * FROM `users` WHERE `username` = ?',
  //       timeout: 40000,
  //       values: ['MrJonWu']
  //     },
  //     function(err, result) {
  //       return expect(result, done);
  //     });
  //   });
  // });

  describe('POST from /api/test/setUser', function() {
    it('returns response', function(done) {
      var testUser = {
        name: 'Jonathan',
        email: 'mrjonwu@gmail.com',
        token: '12345678910',
        username: 'MrJonWu',
        password: 'password',
        thumbnail: 'http://www.safarickszoo.com/wp-content/uploads/2014/03/ocelot2.jpg'
      };
      request
      .post('/api/test/setUser')
      .send(testUser)
      .expect('user has been stored', done);
    });
  });

  describe('GET from /api/test/getUser', function() {
    it('returns response', function(done) {
      var testUser = {
        name: 'Jonathan',
        email: 'mrjonwu@gmail.com',
        token: '12345678910',
        username: 'MrJonWu',
        password: 'password',
        thumbnail: 'http://www.safarickszoo.com/wp-content/uploads/2014/03/ocelot2.jpg'
      };
      request
      .get('/api/test/getUser')
      .send({username: testUser.username})
      .expect('password', done);
    });
  });

  // describe('archived websites', function () {
  //   describe('GET', function () {
  //     it('should return the content of a website from the archive', function (done) {
  //       var fixtureName = 'www.google.com';
  //       var fixturePath = archive.paths.archivedSites + '/' + fixtureName;

  //       // Create or clear the file.
  //       var fd = fs.openSync(fixturePath, 'w');
  //       fs.writeSync(fd, 'google');
  //       fs.closeSync(fd);

  //       // Write data to the file.
  //       fs.writeFileSync(fixturePath, 'google');

  //       request
  //         .get('/' + fixtureName)
  //         .expect(200, /google/, function (err) {
  //           fs.unlinkSync(fixturePath);
  //           done(err);
  //         });
  //     });

  //     it('Should 404 when asked for a nonexistent file', function(done) {
  //       request.get('/arglebargle').expect(404, done);
  //     });
  //   });

  //   describe('POST', function () {
  //     it('should append submitted sites to \'sites.txt\'', function(done) {
  //       var url = 'www.example.com';

  //       // Reset the test file and process request
  //       fs.closeSync(fs.openSync(archive.paths.list, 'w'));

  //       request
  //         .post('/')
  //         .type('form')
  //         .send({ url: url })
  //         .expect(302, function (err) {
  //           if (!err) {
  //             var fileContents = fs.readFileSync(archive.paths.list, 'utf8');
  //             expect(fileContents).to.equal(url + '\n');
  //           }

  //           done(err);
  //         });
  //     });
  //   });
  // });
});
