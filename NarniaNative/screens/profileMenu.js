import React, { Component } from 'react';
import {
  StyleSheet,
  ScrollView,
  Text,
  View,
  Image,
  Dimensions,
  TouchableHighlight,
  Button,
} from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';
import ProfileGallery from './profileGallery';
import ProfileStats from './profileStats';

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    justifyContent: 'center',
  },
  header: {
    flex: 1,
    flexDirection: 'row',
    elevation: 2,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    paddingTop: 20,
    // paddingBottom: 20,
    borderBottomWidth: 1,
    borderBottomColor: '#ff9554'
  },
  scrollContainer: {
    paddingTop: 20,
    flex: 12,
    // fontSize: 80
  },
  backBtn: {
    flex: 1,
    alignItems: 'flex-start',
    paddingLeft: 10,
  },
  text: {
    fontWeight: 'bold',
    fontSize: 26,
    color: '#ff9554'
  },
  textContainer: {
    flex: 4,
    alignItems: 'center',
  }
});

const initialLayout = {
  height: 0,
  width: Dimensions.get('window').width,
};

export default class profileScreen extends Component {
  constructor(props) {
    super(props);
    this.state = {
      color: '#ff9554'
    };
  }

  onButtonPress(button) {
    switch (button) {
    case 'back':
      this.props.navigator.pop();
      break;
    case 'search':
      this.props.navigator.push({
        id: 'SearchScreen'
      });
      break;
    case 'wardrobe':
      this.props.navigator.push({
        id: 'WardrobeScreen'
      });
      break;
    case 'camera':
      this.props.navigator.push({
        id:'cameraScreen'
      });
      break;
    case 'likes':
      this.props.navigator.push({
        id: 'LikesScreen'
      });
      break;
    case 'mixer':
      this.props.navigator.push({
        id: 'Mixer'
      });
      break;
    case 'profile':
      this.props.viewedUser(this.props.userId);
      this.props.navigator.push({
        id: 'ProfileScreen'
      });
      break;
    }
  }

  logoutHandler() {
    this.props.destroySession()
    .then(function() {
      // this.props.navigator.push({
      //   id: 'Login'
      // });
      // while (this.props.navigator.length > 0) {
      //   this.props.navigator.pop();
      // }
      // this.props.navigator.push({
      //   id: 'Login'
      // // });
      this.props.navigator.resetTo({
        id: 'Login'
      });
    }.bind(this));
  }

  render() {
    return (
      <View style={styles.container}>
        <View style={styles.header}>
          <TouchableHighlight onPress={this.onButtonPress.bind(this, 'back')} underlayColor='transparent' style={styles.backBtn}>
            <Icon name="ios-arrow-back" size={38} color={this.state.color} />
          </TouchableHighlight>
          <View style={styles.textContainer}>
            <Text style={styles.text}>Menu</Text>
          </View>
          <View style={styles.backBtn}>
          </View>
        </View>
        <View style={styles.scrollContainer}>
          <ScrollView>
            <Button
              onPress={this.logoutHandler.bind(this)}
              title="Logout"
              color="#ff9554"
              accessibilityLabel="Logout"
            />
            <Button
              onPress={this.onButtonPress.bind(this, 'wardrobe')}
              title="Wardrobe"
              color="#ff9554"
              accessibilityLabel="Wardrobe"
            />
            <Button
              onPress={this.onButtonPress.bind(this, 'camera')}
              title="Add Personal Clothing to Wardrobe"
              color="#ff9554"
              accessibilityLabel="Add Personal Clothing to Wardrobe"
            />
            <Button
              onPress={this.onButtonPress.bind(this, 'search')}
              title="Search"
              color="#ff9554"
              accessibilityLabel="Search"
            />
            <Button
              onPress={this.onButtonPress.bind(this, 'likes')}
              title="Likes"
              color="#ff9554"
              accessibilityLabel="Likes"
            />
            <Button
              onPress={this.onButtonPress.bind(this, 'mixer')}
              title="Mixer"
              color="#ff9554"
              accessibilityLabel="Mixer"
            />
            <Button
              onPress={this.onButtonPress.bind(this, 'profile')}
              title="Profile"
              color="#ff9554"
              accessibilityLabel="Profile"
            />
          </ScrollView>
        </View>
      </View>
    );
  }
}