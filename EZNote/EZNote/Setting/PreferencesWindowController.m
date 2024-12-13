//
//  PreferencesWindowController.m
//  PreferencesWindowDemo
//
//  Created by Chris Shu on 2020/10/16.
//  Copyright © 2020 shushu. All rights reserved.
//

#import "PreferencesWindowController.h"
#import "GeneralViewController.h"
#import "AboutViewController.h"

@interface PreferencesWindowController ()

@end

@implementation PreferencesWindowController



static PreferencesWindowController *_instance;
+ (instancetype)shared {
    if (!_instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            
            NSArray *viewControllers = @[
                [GeneralViewController new],
                [AboutViewController new],
            ];
            
            _instance = [[self alloc] initWithViewControllers:viewControllers];
        });
    }
    return _instance;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (void)showWindow:(id)sender {
    [NSApp activateIgnoringOtherApps:YES];
    [super showWindow:nil];
    [self.window orderFrontRegardless];
}

@end
