#import "NeuHintergrundView.h"

#import <react/renderer/components/RNNeuHintergrundViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNNeuHintergrundViewSpec/EventEmitters.h>
#import <react/renderer/components/RNNeuHintergrundViewSpec/Props.h>
#import <react/renderer/components/RNNeuHintergrundViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "HintergrundView.h"
#import "UIColor+ColorFromString.h"

using namespace facebook::react;

@interface NeuHintergrundView () <RCTNeuHintergrundViewViewProtocol>

@end

@implementation NeuHintergrundView {
    HintergrundView * _view;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
    return concreteComponentDescriptorProvider<NeuHintergrundViewComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        static const auto defaultProps = std::make_shared<const NeuHintergrundViewProps>();
        _props = defaultProps;
        
        _view = [[HintergrundView alloc] initWithFrame:frame];
        
        self.contentView = _view;
    }
    
    return self;
}



- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<NeuHintergrundViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<NeuHintergrundViewProps const>(props);
    
    if (oldViewProps.enabled != newViewProps.enabled) {
        BOOL enabled = (BOOL)newViewProps.enabled;
        NSLog(@"Objective-C BOOL: %@", enabled ? @"YES" : @"NO");
        [_view setBlurEnabled:enabled];
    }
    
    if (oldViewProps.color != newViewProps.color) {
        NSString *colorToConvert = [[NSString alloc] initWithUTF8String:newViewProps.color.c_str()];
        
        UIColor *color = [UIColor colorWithRGBAString:colorToConvert];
        
        [_view setBlurColor:color];
    }
    
    
    if (oldViewProps.blurType != newViewProps.blurType) {
        NSString *blurString = [[NSString alloc] initWithUTF8String:newViewProps.blurType.c_str()];
        UIBlurEffectStyle backgroundEffect = [self backgroundStringToBlurType:blurString];
        
        [_view setBlurType:backgroundEffect];
    }
    
    if (oldViewProps.blurRadius != newViewProps.blurRadius) {
        NSNumber *blurRadius = [NSNumber numberWithLong:newViewProps.blurRadius];
        [_view setBlurAmount:blurRadius];
    }
    
    
    [super updateProps:props oldProps:oldProps];
}

Class<RCTComponentViewProtocol> NeuHintergrundViewCls(void)
{
    return NeuHintergrundView.class;
}

- hexStringToColor:(NSString *)stringToConvert
{
    NSString *noHashString = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *stringScanner = [NSScanner scannerWithString:noHashString];
    
    unsigned hex;
    if (![stringScanner scanHexInt:&hex]) return nil;
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1.0f];
}

- (UIBlurEffectStyle)backgroundStringToBlurType: (NSString *)rawBlur {
    if ([rawBlur isEqualToString:@"extraLight"]) {
        return UIBlurEffectStyleExtraLight;
    } else if ([rawBlur isEqualToString:@"light"]) {
        return UIBlurEffectStyleLight;
    } else if ([rawBlur isEqualToString:@"dark"]) {
        return UIBlurEffectStyleDark;
    } else if (@available(iOS 10.0, *)) {
        if ([rawBlur isEqualToString:@"prominent"]) {
            return UIBlurEffectStyleProminent;
        } else if ([rawBlur isEqualToString:@"regular"]) {
            return UIBlurEffectStyleRegular;
        }
    }
    
    if (@available(iOS 13.0, *)) {
        if ([rawBlur isEqualToString:@"systemUltraThinMaterial"]) {
            return UIBlurEffectStyleSystemUltraThinMaterial;
        } else if ([rawBlur isEqualToString:@"systemThinMaterial"]) {
            return UIBlurEffectStyleSystemThinMaterial;
        } else if ([rawBlur isEqualToString:@"systemMaterial"]) {
            return UIBlurEffectStyleSystemMaterial;
        } else if ([rawBlur isEqualToString:@"systemThickMaterial"]) {
            return UIBlurEffectStyleSystemThickMaterial;
        } else if ([rawBlur isEqualToString:@"systemChromeMaterial"]) {
            return UIBlurEffectStyleSystemChromeMaterial;
        } else if ([rawBlur isEqualToString:@"systemMaterialLight"]) {
            return UIBlurEffectStyleSystemMaterialLight;
        } else if ([rawBlur isEqualToString:@"systemThinMaterialLight"]) {
            return UIBlurEffectStyleSystemThinMaterialLight;
        } else if ([rawBlur isEqualToString:@"systemUltraThinMaterialLight"]) {
            return UIBlurEffectStyleSystemUltraThinMaterialLight;
        } else if ([rawBlur isEqualToString:@"systemThickMaterialLight"]) {
            return UIBlurEffectStyleSystemThickMaterialLight;
        } else if ([rawBlur isEqualToString:@"systemChromeMaterialLight"]) {
            return UIBlurEffectStyleSystemChromeMaterialLight;
        } else if ([rawBlur isEqualToString:@"systemMaterialDark"]) {
            return UIBlurEffectStyleSystemMaterialDark;
        } else if ([rawBlur isEqualToString:@"systemThinMaterialDark"]) {
            return UIBlurEffectStyleSystemThinMaterialDark;
        } else if ([rawBlur isEqualToString:@"systemUltraThinMaterialDark"]) {
            return UIBlurEffectStyleSystemUltraThinMaterialDark;
        } else if ([rawBlur isEqualToString:@"systemThickMaterialDark"]) {
            return UIBlurEffectStyleSystemThickMaterialDark;
        } else if ([rawBlur isEqualToString:@"systemChromeMaterialDark"]) {
            return UIBlurEffectStyleSystemChromeMaterialDark;
        }
    }
    
    return UIBlurEffectStyleExtraLight;
}



@end
