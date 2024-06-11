import {NeuHintergrund} from 'neu-hintergrund';
import React from 'react';
import {Image, StyleSheet, View} from 'react-native';

//TODO: upgrade RN
//TODO: fix issue with changing blurAmount breaks default styles
//TODO: unify interface
const image = require('./res/images/city.jpg');
const color = 'rgba(12,21,4,0.1)';
function App(): React.JSX.Element {
  return (
    <View style={styles.backgroundStyle}>
      <Image
        source={image}
        style={{
          flex: 1,
        }}
      />
      <NeuHintergrund
        style={StyleSheet.absoluteFill}
        enabled={true}
        blurType="dark"
        color={color}
        blurRadius={20}
      />
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
