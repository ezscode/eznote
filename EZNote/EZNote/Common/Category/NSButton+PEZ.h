//
//  NSButton+PEZ.h
//  NEITNetManager
//
//  Created by administrator on 2018/11/1.
//  Copyright © 2018 ez. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define check_high_image [NSImage imageNamed:@"icon_check"]

#define check_norm_image [NSImage imageNamed:@"icon_checkbox"]

#define Selected_high(btn) [btn setImage:check_high_image]
#define Selected_norm(btn) [btn setImage:check_norm_image]

NS_ASSUME_NONNULL_BEGIN


@interface NSView (PEZ)

- (void)ezSetLayerColor:(NSColor *)layerColor;


@end

@interface NSTextField (PEZ)

- (void)ezInputStyle;
- (void)ezLabelStyle;

@end


@interface NSButton (PEZ)

- (void)ezCommonSetting;


- (void)ezPureImageBtn:(NSImage *)image;

- (void)ezAddTarget:(nullable id)target andAction:(nullable SEL)selector;

@end

NS_ASSUME_NONNULL_END
