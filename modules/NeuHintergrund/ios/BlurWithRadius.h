#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlurWithRadius : UIBlurEffect

@property (nonatomic, strong, nullable) NSNumber *blurAmount;

+ (instancetype)effectWithStyle:(UIBlurEffectStyle)style andBlurAmount:(nullable NSNumber *)blurAmount;

- (instancetype)copyWithBlurAmount:(NSNumber *)blurAmount;
@end

NS_ASSUME_NONNULL_END
