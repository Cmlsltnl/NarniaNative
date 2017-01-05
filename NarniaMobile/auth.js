import Exponent from 'exponent';
import {
  Navigator, Alert, AsyncStorage,
} from 'react-native';

module.exports = {
  setToken: async function(token) {
    if (token) {
      try {
        await AsyncStorage.setItem('@Sessiontoken:token', token);
      } catch (error) {
        console.error(error, 'SET TOKEN ERROR');
      }
    } else {
      console.error('setToken requires a token as an argument');
    }
  },

  getToken: async function() {
    try { // returns boolean for whether or not they are logged in;
      const value = await AsyncStorage.getItem('@Sessiontoken:token');
      if (value !== null){
        // We have data!!
        return value;
      } else {
        return null;
      }
    } catch (error) {
      // Error retrieving data
      console.log(error, 'GET TOKEN ERROR');
      return null;
    }
  },

  setId: async function(id) {
    if (id) {
      try {
        await AsyncStorage.setItem('@SessionId:id', id);
      } catch (error) {
        console.error(error, 'SET ID ERROR')
      }
    } else {
      console.error('setId requires an id as an argument');
    }
  },

  getId: async function() {
    try {
      const value = await AsyncStorage.getItem('@SessionId:id');
      if (value !== null) {
        return value;
      } else {
        return null;
      }
    } catch (error) {
      console.log(error, 'GET ID ERROR');
      return null;
    }
  },

  destroySession: async function() {
    var blank = null;
    try {
      await AsyncStorage.removeItem('@Sessiontoken:token');
      await AsyncStorage.removeItem('@SessionId:id');
      console.log('SESSION DESTROYED')
    } catch (error) {
      console.log(error, 'ERROR DESTROYING SESSION');
    }
  },

  logIn: async function() {
    const { type, token, expires } = await Exponent.Facebook.logInWithReadPermissionsAsync(
      '365948040432096', {
        permissions: ['public_profile', 'email', 'user_friends'],
      });
    if (type === 'success') {
      setToken(token);
      const response = await fetch(`https://graph.facebook.com/me?access_token=${token}`)
      .then(function(resp) {
        var body = JSON.parse(resp._bodyText);
        setId(body.id);

        fetch('http://10.6.19.8:3000/api/users/mobileFbLogin', {
          method: 'POST',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(resp)
        })
      })

      Alert.alert(
        'Logged in!',
        `Hi ${(await response.json()).name}!`,
      );
    } else if (type === 'cancel') {
      // send user to public view
    }
  },

  test: function() {
    console.log('THIS IS NOT A DRILL');
  }
}