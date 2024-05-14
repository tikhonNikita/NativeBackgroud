import {FC} from 'react';
import {ViewProps} from 'react-native';

import {default as NeuHintergrundViewNative} from '../NeuHintergrundViewNativeComponentAndroid';
import React from 'react';

export type NeuHintergrundViewProps = ViewProps & {
  color: string;
  blurRadius?: number;
};

export const NeuHintergrundView: FC<NeuHintergrundViewProps> = ({
  color,
  blurRadius = 1,
  ...rest
}) => {
  return (
    <NeuHintergrundViewNative
      {...rest}
      blurRadius={Math.max(1, blurRadius)}
      color={color}
    />
  );
};
