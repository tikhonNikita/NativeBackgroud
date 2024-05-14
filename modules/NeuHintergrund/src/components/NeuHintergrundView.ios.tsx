import {default as NeuHintergrundViewNative} from '../NeuHintergrundViewNativeComponent';
import React from 'react';
import {FC} from 'react';
import {ViewProps} from 'react-native';

export type NeuHintergrundViewProps = ViewProps & {
  color: string;
  blurType: string;
  blurRadius: number;
};

export const NeuHintergrundView: FC<NeuHintergrundViewProps> = ({
  color,
  blurRadius = 1,
  blurType = 'light',
}) => {
  return (
    <NeuHintergrundViewNative
      blurRadius={blurRadius}
      color={color}
      blurType={blurType}
    />
  );
};
