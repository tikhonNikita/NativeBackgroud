import {NeuHintergrundView} from 'neu-hintergrund';
import React from 'react';
import {View, StyleSheet} from 'react-native';
//systemThickMaterialLight
//systemChromeMaterialLight
//systemUltraThinMaterialDark
function App(): React.JSX.Element {
  return (
    <View style={styles.backgroundStyle}>
      <NeuHintergrundView
        style={styles.container}
        color="#f1f1f1"
        blurType="systemUltraThinMaterialLight"
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  backgroundStyle: {
    backgroundColor: 'red',
    flex: 1,
  },
});
export default App;
