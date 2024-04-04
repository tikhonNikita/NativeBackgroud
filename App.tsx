/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {
  SafeAreaView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
} from 'react-native';
import {BackgroudView} from 'react-native-backgroud';

import {Colors} from 'react-native/Libraries/NewAppScreen';

function App(): React.JSX.Element {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: 'lightblue',
    flex: 1,
  };

  return (
    <SafeAreaView style={backgroundStyle}>
      <BackgroudView
        style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}
        color="##a18a3a"
      />
    </SafeAreaView>
  );
}
export default App;
