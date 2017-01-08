import React from 'react';
import {
  Text,
  View,
  StyleSheet,
  Component,
  Dimensions,
  Image,
} from 'react-native';

const styles = StyleSheet.create({
  textStyle: {
    fontSize: 18,
    fontWeight: 'bold',
    paddingLeft: 10,
  },
  container: {
    flex: 1,
    flexDirection: 'row',
    flexWrap: 'wrap',
    alignItems: 'flex-start',
  },
  imgLarge: {
    width: Dimensions.get('window').width,
    height: Dimensions.get('window').width,
    borderWidth: 1,
    borderColor: '#fff',
  },
  imgSmall: {
    width: Dimensions.get('window').width / 2,
    height: Dimensions.get('window').width / 2,
    borderWidth: 1,
    borderColor: '#fff',
  },
});

var LikesGallery = (props) => {
  return (
    <View style={styles.container}>
      {props.userPosts.map((body, key) => {
        if (key === 0) {
          return <View key={key}><Image style={styles.imgLarge} source={{uri: body}} /></View>;
        } else {
          return <View key={key}><Image style={styles.imgSmall} source={{uri: body}} /></View>;
        }
      })}
    </View>
  );
};

module.exports = LikesGallery;