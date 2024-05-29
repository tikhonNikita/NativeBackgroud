//
//  BlurWithRadius.h
//  Pods
//
//  Created by Nikita Tikhonov on 27.05.2024.
//

#import <UIKit/UIKit.h>

@interface BlurWithRadius : UIBlurEffect

@property (nonatomic, strong) NSNumber *blurAmount;

+ (instancetype)effectWithStyle:(UIBlurEffectStyle)style blurAmount:(NSNumber *)blurAmount;

@end

