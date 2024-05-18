import {NeuHintergrund} from 'neu-hintergrund';
import React from 'react';
import {Image, StyleSheet, Text, View} from 'react-native';

const image = require('./res/images/city.jpg');
const color = 'rgba(200,100,21,0.22)';

function App(): React.JSX.Element {
  return (
    <View style={styles.backgroundStyle}>
      <Image source={image} style={StyleSheet.absoluteFill} />
      <NeuHintergrund
        style={StyleSheet.absoluteFill}
        color={color}
        blurRadius={20}
        enabled={true}
      />
      <View
        style={{
          backgroundColor: 'white',
          alignItems: 'center',
          justifyContent: 'center',
          alignSelf: 'center',
          padding: 10,
        }}>
        <Text>Background</Text>
        <NeuHintergrund
          style={StyleSheet.absoluteFill}
          color={'rgba(20,6,236,0.37)'}
          blurRadius={1}
          enabled={true}
        />
      </View>
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
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default App;
