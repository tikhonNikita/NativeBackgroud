//
//  HintergrundView.m
//  neu-hintergrund
//
//  Created by Nikita Tikhonov on 04.04.2024.
//

#import "HintergrundView.h"
#import "BlurWithRadius.m"

@interface HintergrundView ()

@property (strong, nonatomic) UIVisualEffectView *backgroundBlurEffectView;

@end

@implementation HintergrundView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _backgroundBlurEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    _backgroundBlurEffectView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_backgroundBlurEffectView];
    
    [self setupConstraints];
}

- (void)setupConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [_backgroundBlurEffectView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [_backgroundBlurEffectView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_backgroundBlurEffectView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [_backgroundBlurEffectView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
}

- (void)setBlurType:(UIBlurEffectStyle)blurEffect {
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle: blurEffect];
    _backgroundBlurEffectView.effect = effect;
}

@end
