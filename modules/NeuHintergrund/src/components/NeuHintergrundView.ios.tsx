import React from 'react';
import {FC} from 'react';
import {ViewProps} from 'react-native';
import {NeuHintergrundViewNativeIOS} from '../nativeViews';

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
    <NeuHintergrundViewNativeIOS
      blurRadius={blurRadius}
      color={color}
      blurType={blurType}
    />
  );
};
