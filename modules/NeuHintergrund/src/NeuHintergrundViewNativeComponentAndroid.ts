import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type {ViewProps} from 'react-native';
import {Float} from 'react-native/Libraries/Types/CodegenTypes';

interface NativeProps extends ViewProps {
  color?: string;
  blurRadius: Float;
}

export default codegenNativeComponent<NativeProps>(
  'AndroidNeuHintergrundView',
  {
    excludedPlatforms: ['iOS'],
  },
);
