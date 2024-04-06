//
//  HintergrundView.m
//  neu-hintergrund
//
//  Created by Nikita Tikhonov on 04.04.2024.
//

#import "HintergrundView.h"

@interface HintergrundView ()

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIView *labelContainerView;
@property (strong, nonatomic) UIVisualEffectView *backgroundBlurEffectView;
@property (strong, nonatomic) UIVisualEffectView *labelBlurEffectView;

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
    
    _labelContainerView = [[UIView alloc] init];
    _labelContainerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_labelContainerView];
    
    _labelBlurEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    _labelBlurEffectView.translatesAutoresizingMaskIntoConstraints = NO;
    [_labelContainerView addSubview:_labelBlurEffectView];
    
    _label = [[UILabel alloc] init];
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"The text color";
    _label.font = [UIFont boldSystemFontOfSize:12];
    [_labelContainerView addSubview:_label];
    
    [self setupConstraints];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _backgroundBlurEffectView.frame = self.bounds;
    _labelBlurEffectView.frame = _labelContainerView.bounds;
}

- (void)setupConstraints {
    // BackgroundBlurEffectView constraints
    [NSLayoutConstraint activateConstraints:@[
        [_backgroundBlurEffectView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [_backgroundBlurEffectView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_backgroundBlurEffectView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [_backgroundBlurEffectView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
    
    // LabelContainerView constraints
    [NSLayoutConstraint activateConstraints:@[
        [_labelContainerView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [_labelContainerView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor]
    ]];
    
    // LabelBlurEffectView constraints
    [NSLayoutConstraint activateConstraints:@[
        [_labelBlurEffectView.topAnchor constraintEqualToAnchor:_labelContainerView.topAnchor],
        [_labelBlurEffectView.leadingAnchor constraintEqualToAnchor:_labelContainerView.leadingAnchor],
        [_labelBlurEffectView.trailingAnchor constraintEqualToAnchor:_labelContainerView.trailingAnchor],
        [_labelBlurEffectView.bottomAnchor constraintEqualToAnchor:_labelContainerView.bottomAnchor]
    ]];
    
    // Label constraints
    [NSLayoutConstraint activateConstraints:@[
        [_label.leadingAnchor constraintEqualToAnchor:_labelContainerView.leadingAnchor constant:8],
        [_label.trailingAnchor constraintEqualToAnchor:_labelContainerView.trailingAnchor constant:-8],
        [_label.topAnchor constraintEqualToAnchor:_labelContainerView.topAnchor constant:8],
        [_label.bottomAnchor constraintEqualToAnchor:_labelContainerView.bottomAnchor constant:-8]
    ]];
}

- (void)setTextColor:(UIColor *)color {
    _label.textColor = color;
}


- (void)setBlurType:(UIBlurEffectStyle)blurEffect {
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle: blurEffect];
    _backgroundBlurEffectView.effect = effect;
}

@end

