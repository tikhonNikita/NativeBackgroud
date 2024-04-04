#import <React/RCTViewManager.h>
#import "react_native_backgroud-Swift.h"

@interface BackgroundViewManager : RCTViewManager
@end

@implementation BackgroundViewManager

RCT_EXPORT_MODULE(BackgroundView)

- (UIView *)view
{
  return [[BackgroundView alloc] init];
}

RCT_CUSTOM_VIEW_PROPERTY(color, NSString, BackgroundView)
{
  [view setTextColor:[self hexStringToColor:json]];
}

- (UIColor *)hexStringToColor:(NSString *)stringToConvert
{
  NSString *noHashString = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
  NSScanner *scanner = [NSScanner scannerWithString:noHashString];

  unsigned hex;
  if (![scanner scanHexInt:&hex]) return nil;
  CGFloat r = ((hex >> 16) & 0xFF) / 255.0f;
  CGFloat g = ((hex >> 8) & 0xFF) / 255.0f;
  CGFloat b = (hex & 0xFF) / 255.0f;

  return [UIColor colorWithRed:r green:g blue:b alpha:1.0f];
}

@end
