import {NeuHintergrund} from 'neu-hintergrund';
import React from 'react';
import {Image, StyleSheet, View} from 'react-native';

//TODO: Add blur ammount
//TODO: upgrade RN
const image = require('./res/images/city.jpg');
const color = 'rgba(200,100,21,0.22)';
function App(): React.JSX.Element {
  return (
    <View style={styles.backgroundStyle}>
      <NeuHintergrund blurType="light" color={color} enabled={true}>
        <Image
          source={image}
          style={{
            flex: 1,
          }}
        />
      </NeuHintergrund>
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
