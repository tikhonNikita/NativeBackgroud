//
//  UIColor+ColorFromString.h
//  neu-hintergrund
//
//  Created by Nikita Tikhonov on 01.06.2024.
//
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIColor (ColorFromString)

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithRGBAString:(NSString *)rgbaString;

@end

@implementation UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)hexString {
    if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }
    
    if ([hexString length] != 6) {
        return nil;
    }
    
    NSString *redString = [hexString substringWithRange:NSMakeRange(0, 2)];
    NSString *greenString = [hexString substringWithRange:NSMakeRange(2, 2)];
    NSString *blueString = [hexString substringWithRange:NSMakeRange(4, 2)];
    

    unsigned red, green, blue;
    [[NSScanner scannerWithString:redString] scanHexInt:&red];
    [[NSScanner scannerWithString:greenString] scanHexInt:&green];
    [[NSScanner scannerWithString:blueString] scanHexInt:&blue];
    

    return [UIColor colorWithRed:(CGFloat)red / 255.0
                           green:(CGFloat)green / 255.0
                            blue:(CGFloat)blue / 255.0
                           alpha:0.3];
}

+ (UIColor *)colorWithRGBAString:(NSString *)rgbaString {
    NSString *trimmedString = [rgbaString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    trimmedString = [trimmedString stringByReplacingOccurrencesOfString:@"rgba(" withString:@""];
    trimmedString = [trimmedString stringByReplacingOccurrencesOfString:@")" withString:@""];
    
    
    NSArray<NSString *> *components = [trimmedString componentsSeparatedByString:@","];
    if (components.count != 4) {
        return nil;
    }
    
    
    CGFloat red = [components[0] floatValue] / 255.0;
    CGFloat green = [components[1] floatValue] / 255.0;
    CGFloat blue = [components[2] floatValue] / 255.0;
    CGFloat alpha = [components[3] floatValue];
    
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end


NS_ASSUME_NONNULL_END
