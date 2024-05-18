import {FC} from 'react';
import {ViewProps} from 'react-native';

import type {ColorValue} from 'react-native';

import React from 'react';
import {NeuHintergrundViewNativeAndroid} from '../nativeViews';

export type NeuHintergrundViewProps = ViewProps & {
  color: ColorValue;
  blurRadius?: number;
};

export const NeuHintergrundView: FC<NeuHintergrundViewProps> = ({
  color,
  blurRadius = 1,
  ...rest
}) => {
  return (
    <NeuHintergrundViewNativeAndroid
      {...rest}
      blurRadius={Math.max(1, blurRadius)}
      color={color}
    />
  );
};
