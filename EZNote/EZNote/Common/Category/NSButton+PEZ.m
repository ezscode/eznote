//
//  NSButton+PEZ.m
//  NEITNetManager
//
//  Created by administrator on 2018/11/1.
//  Copyright © 2018 ez. All rights reserved.
//

#import "NSButton+PEZ.h"



@implementation NSTextField (PEZ)

- (void)ezInputStyle{
    self.bordered = NO;
    self.editable = YES;
    self.font = [NSFont systemFontOfSize:14];
    
    [self setFocusRingType:NSFocusRingTypeNone];
}

- (void)ezLabelStyle{
    
    self.editable = NO;
    self.bordered = NO;
    self.font = [NSFont systemFontOfSize:14];
//    self.textColor = kColor_TextBlack;ms
    
    self.backgroundColor = [NSColor clearColor];
}

@end


@implementation NSView (PEZ)

- (void)ezSetLayerColor:(NSColor *)layerColor{
    
    self.wantsLayer = YES;
    self.layer.backgroundColor = layerColor.CGColor;
    
}

@end


@implementation NSButton (PEZ)

- (void)ezCommonSetting{
    
    [self ezSetLayerColor:[NSColor clearColor]];
    [self setBezelStyle:NSBezelStyleTexturedSquare];
    [self setButtonType:NSButtonTypeMomentaryChange];
    self.bordered = NO;
    self.imagePosition = NSImageLeft;
    self.focusRingType = NSFocusRingTypeNone;
    self.font = [NSFont systemFontOfSize:14];
}


- (void)ezPureImageBtn:(NSImage *)image{
 
    [self ezCommonSetting];
    
    [self setImage:image];
    self.imageScaling = NSImageScaleNone;
    self.imagePosition =  NSImageOnly;
}


- (void)ezAddTarget:(nullable id)target andAction:(nullable SEL)selector{
    [self setTarget:target];
    [self setAction:selector];
}


@end
