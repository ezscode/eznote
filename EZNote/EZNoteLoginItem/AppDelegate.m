//
//  AppDelegate.m
//  EZNoteLoginItem
//
//  Created by 舒姝 on 2024/12/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    NSLog(@"****************支言 LoginItem");
    printf("----------------支言 LoginItem");
     
    dispatch_after(1, dispatch_get_main_queue(), ^{
        
        [self launchMainApp];
        
    });
     
}

- (void)launchMainApp{
    
    NSString *identifier = @"com.ez.EZNote";
    
    identifier = [identifier stringByReplacingOccurrencesOfString:@"Helper" withString:@""];
    
    __block BOOL alreadyRunning = NO;
    [NSWorkspace.sharedWorkspace.runningApplications enumerateObjectsUsingBlock:^(NSRunningApplication * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.bundleIdentifier isEqualToString:identifier]) {
            alreadyRunning = YES;
            *stop = YES;
        }
    }];
    
    if (!alreadyRunning) {
        NSURL *appURL = [[NSWorkspace sharedWorkspace] URLForApplicationWithBundleIdentifier:identifier];
        NSError *error = nil;
        [[NSWorkspace sharedWorkspace] launchApplicationAtURL:appURL options:NSWorkspaceLaunchWithoutActivation configuration:@{} error:&error];
        
        if (error) {
            NSLog(@"Helper 启动 %@ 报错\n%@", identifier, error);
        }
    }
    [NSApp terminate:nil];
}



- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
