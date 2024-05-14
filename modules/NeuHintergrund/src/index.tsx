import {NeuHintergrundView} from './components/NeuHintergrundView';
import type {NeuHintergrundViewProps as NeuHintergrundPropsIOS} from './components/NeuHintergrundView.ios';
import type {NeuHintergrundViewProps as NeuHintergrundPropsAndroid} from './components/NeuHintergrundView.android';
export * from './NeuHintergrundViewNativeComponent';

type NeuHintergrundProps = NeuHintergrundPropsIOS | NeuHintergrundPropsAndroid;
const NeuHintergrund =
  NeuHintergrundView as React.ComponentType<NeuHintergrundProps>;

export {NeuHintergrund};

//TODO: rename android to AndroidNeuHintergrundView
