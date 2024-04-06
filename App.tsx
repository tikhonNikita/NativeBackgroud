import {NeuHintergrundView} from 'neu-hintergrund';
import React from 'react';
import {SafeAreaView, StyleSheet} from 'react-native';

function App(): React.JSX.Element {
  const backgroundStyle = {
    backgroundColor: 'red',
    flex: 1,
  };

  return (
    <SafeAreaView style={backgroundStyle}>
      <NeuHintergrundView style={styles.container} color="#f1f1a6" />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});
export default App;
