import {NeuHintergrund} from 'neu-hintergrund';
import React from 'react';
import {Image, StyleSheet, Text, View} from 'react-native';

const image = require('./res/images/city.jpg');
const color = 'rgba(200,100,21,0.22)';
//TODO: Turn off blur
//TODO: Validate border radius
//TODO: Downsampling factor
function App(): React.JSX.Element {
  return (
    <View style={styles.backgroundStyle}>
      <Image source={image} style={StyleSheet.absoluteFill} />
      <NeuHintergrund
        color={color}
        style={StyleSheet.absoluteFill}
        blurRadius={12}
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
    opacity: 1,
  },
  backgroundStyle: {
    flex: 1,
    backgroundColor: 'green',
  },
});

export default App;
