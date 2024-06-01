//  Created by Nikita Tikhonov on 27.05.2024.
//

#import "BlurWithRadius.h"
#import <objc/runtime.h>

@interface UIBlurEffect (Protected)
@property (nonatomic, readonly) id effectSettings;
@end

@implementation BlurWithRadius

+ (instancetype)effectWithStyle:(UIBlurEffectStyle)style andBlurAmount:(NSNumber *)blurAmount {
    BlurWithRadius *effect = (BlurWithRadius *)[super effectWithStyle:style];
    effect.blurAmount = blurAmount;
    return effect;
}

- (id)effectSettings {
    id settings = [super effectSettings];
      if (settings && _blurAmount) {
          [settings setValue:_blurAmount forKey:@"blurRadius"];
      } else {
          NSLog(@"settings is nil");
      }
    return settings;
}

- (instancetype)copyWithBlurAmount:(NSNumber *)blurAmount {
    BlurWithRadius *copy = [[self class] effectWithStyle:[self style] andBlurAmount:blurAmount];
    return copy;
}

- (UIBlurEffectStyle)style {
    id settings = [self effectSettings];
    if (settings) {
        NSNumber *styleValue = [settings valueForKey:@"style"];
        return (UIBlurEffectStyle)[styleValue integerValue];
    }
    return UIBlurEffectStyleLight;
}

@end
