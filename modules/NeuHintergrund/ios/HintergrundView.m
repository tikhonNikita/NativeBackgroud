//
//  HintergrundView.m
//  neu-hintergrund
//
//  Created by Nikita Tikhonov on 04.04.2024.
//

#import "HintergrundView.h"
#import "BlurWithRadius.h"

@interface HintergrundView ()

@property (strong, nonatomic) UIVisualEffectView *backgroundBlurEffectView;
@property (strong, nonatomic, nullable) BlurWithRadius *blurEffect;
@property (nonatomic) BOOL blurEnabled;


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
    _backgroundBlurEffectView = [[UIVisualEffectView alloc] initWithEffect:nil];
    _blurEnabled = NO;
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
    BlurWithRadius *effect = [BlurWithRadius effectWithStyle:blurEffect andBlurAmount: @10];
    _blurEffect = effect;
    if (_blurEnabled) {
        _backgroundBlurEffectView.effect = effect;
    }
}

- (void)setBlurAmount:(nonnull NSNumber *)blurAmount {
    BlurWithRadius *effect = [(BlurWithRadius *)_blurEffect copyWithBlurAmount:blurAmount];
    _backgroundBlurEffectView.effect = nil;
    _blurEffect = effect;
    if (_blurEnabled) {
        _backgroundBlurEffectView.effect = effect;
    }
}

- (void)setBlurColor:(nonnull UIColor *)blurColor {
    self.backgroundColor = blurColor;
}

- (void)setBlurEnabled:(BOOL)enabled {
    _blurEnabled = enabled;
    if(_blurEnabled) {
        _backgroundBlurEffectView.effect = _blurEffect;
        return;
    }
    _backgroundBlurEffectView.effect = nil;
}

@end
