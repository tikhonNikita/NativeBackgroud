import {NeuHintergrundView} from 'neu-hintergrund';
import React from 'react';
import {StyleSheet, Text, ImageBackground} from 'react-native';

const image = require('./res/images/city.jpg');

function App(): React.JSX.Element {
  return (
    <ImageBackground
      style={styles.backgroundStyle}
      source={image}
      imageStyle={{
        width: '100%',
        height: '100%',
      }}>
      <NeuHintergrundView
        style={styles.container}
        color="#f1f1f1"
        blurType="systemUltraThickMaterialLight">
        <Text>NeuHintergrundView</Text>
      </NeuHintergrundView>
    </ImageBackground>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  backgroundStyle: {
    flex: 1,
    backgroundColor: 'green',
  },
});

export default App;
