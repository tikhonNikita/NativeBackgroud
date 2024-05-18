import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type {ViewProps, ColorValue} from 'react-native';
import {Float} from 'react-native/Libraries/Types/CodegenTypes';

interface NativeProps extends ViewProps {
  color: ColorValue;
  blurRadius: Float;
  enabled: boolean;
}

export default codegenNativeComponent<NativeProps>(
  'AndroidNeuHintergrundView',
  {
    excludedPlatforms: ['iOS'],
  },
);
