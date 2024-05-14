import {NeuHintergrund} from 'neu-hintergrund';
import React from 'react';
import {Image, StyleSheet, Text, View} from 'react-native';

const image = require('./res/images/city.jpg');
//TODO: restore after invalid
//TODO: turn off blur
function App(): React.JSX.Element {
  return (
    <View style={styles.backgroundStyle}>
      <Image source={image} style={StyleSheet.absoluteFill} />
      <NeuHintergrund
        color="#1a2fafbb" //TODO: restore after invalid
        style={StyleSheet.absoluteFill}
        blurRadius={5}
      />
      <Text>Background</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: 'green',
  },
  backgroundStyle: {
    flex: 1,
    backgroundColor: 'green',
  },
});

export default App;
