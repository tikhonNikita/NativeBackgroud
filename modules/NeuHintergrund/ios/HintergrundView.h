//
//  HintergrundView.h
//  neu-hintergrund
//
//  Created by Nikita Tikhonov on 04.04.2024.
//
#import <objc/runtime.h>

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface HintergrundView : UIView

- (void)setBlurType:(UIBlurEffectStyle)blurEffect;
- (void)setBlurAmount:(NSNumber*)blurAmount;
- (void)setBlurColor:(UIColor*)blurColor;

@end


NS_ASSUME_NONNULL_END
