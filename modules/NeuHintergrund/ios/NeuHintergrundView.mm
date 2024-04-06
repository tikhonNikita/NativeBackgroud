#import "NeuHintergrundView.h"

#import <react/renderer/components/RNNeuHintergrundViewSpec/ComponentDescriptors.h>
#import <react/renderer/components/RNNeuHintergrundViewSpec/EventEmitters.h>
#import <react/renderer/components/RNNeuHintergrundViewSpec/Props.h>
#import <react/renderer/components/RNNeuHintergrundViewSpec/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"
#import "HintergrundView.h"

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

    _view = [[HintergrundView alloc] init];

    self.contentView = _view;
  }

  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
    const auto &oldViewProps = *std::static_pointer_cast<NeuHintergrundViewProps const>(_props);
    const auto &newViewProps = *std::static_pointer_cast<NeuHintergrundViewProps const>(props);

    if (oldViewProps.color != newViewProps.color) {
        NSString * colorToConvert = [[NSString alloc] initWithUTF8String: newViewProps.color.c_str()];
        [_view setTextColor:[self hexStringToColor:colorToConvert]];
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

@end
