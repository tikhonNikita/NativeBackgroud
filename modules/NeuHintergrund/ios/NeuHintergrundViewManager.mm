#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import "RCTBridge.h"

@interface NeuHintergrundViewManager : RCTViewManager
@end

@implementation NeuHintergrundViewManager

RCT_EXPORT_MODULE(NeuHintergrundView)
RCT_EXPORT_VIEW_PROPERTY(color, NSString)
RCT_EXPORT_VIEW_PROPERTY(blurType, NSString)

@end
