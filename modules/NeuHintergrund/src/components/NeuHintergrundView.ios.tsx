import React from 'react';
import {FC} from 'react';
import {ViewProps} from 'react-native';
import {NeuHintergrundViewNativeIOS} from '../nativeViews';

export type NeuHintergrundViewProps = ViewProps & {
  color: string;
  blurType: string;
  blurRadius: number;
  enabled: boolean;
};

export const NeuHintergrundView: FC<NeuHintergrundViewProps> = ({
  color,
  blurRadius = 1,
  blurType = 'light',
  enabled,
  ...rest
}) => {
  return (
    <NeuHintergrundViewNativeIOS
      blurRadius={blurRadius}
      color={color}
      enabled={enabled}
      blurType={blurType}
      {...rest}
    />
  );
};
