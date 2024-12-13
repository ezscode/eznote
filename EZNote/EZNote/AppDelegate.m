//
//  AppDelegate.m
//  EZNote
//
//  Created by 舒姝 on 2024/9/29.
//

#import "AppDelegate.h"

#import "WriteViewController.h"
#import "PreferencesWindowController.h"

#import <ServiceManagement/ServiceManagement.h>

@interface AppDelegate ()<NSTextFieldDelegate>


@property (strong,nonatomic) NSStatusItem *item;
@property (strong) NSPopover *popover;

@property(nonatomic,strong) WriteViewController * writeVC;


@end

@implementation AppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self setUpStatusBar];

    [self setUpPopover];
    
    NSLog(@"****************支言");
    printf("----------------支言");
     
    
    [self settings];
}


- (void)settings{
     
    // 已经用过不再设置
    if ([[NSUserDefaults standardUserDefaults] boolForKey:kDidUse]) {
        
        return;
    }
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kDidUse];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kShouldAutoLaunch];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
//    NSArray *jobs = (__bridge NSArray *)(SMCopyAllJobDictionaries(kSMDomainUserLaunchd));
//    NSLog(@"jobs : %@", jobs);
    
    NSString *helperPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent: @"Contents/Library/LoginItems/StatusNoteLoginItem.app"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:helperPath])
    {
    NSLog(@"login item app 不存在");
        return;
    }
    
    if (SMLoginItemSetEnabled((__bridge CFStringRef)BundleID_LoginItem, true)){
        
        NSLog(@"SMLoginItemSetEnabled success!");
    }else{
        
        NSLog(@"SMLoginItemSetEnabled failed!");
    }
    
    
//    CFStringRef bid = (__bridge CFStringRef)BundleID_LoginItem;
//    BOOL ret = SMLoginItemSetEnabled(bid, true);
    
    
}


- (void) setUpStatusBar {
    //获取系统单例NSStatusBar对象
    NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
    
    //创建固定宽度的NSStatusItem
    NSStatusItem *item = [statusBar statusItemWithLength:NSVariableStatusItemLength];
    
    [item.button setTarget:self];
    [item.button setAction:@selector(itemAction:)];
    
    item.button.image = [NSImage imageNamed:@"write"];
    
    //设置下拉菜单
   // item.menu = self.shareMenu;
    
    //保存到属性变量
    self.item = item;
    
}

- (void)itemAction:(NSStatusBarButton *)item{
    
    NSLog(@"-- itemAction");
    
    [self.popover showRelativeToRect:[self.item.button bounds] ofView:self.item.button preferredEdge:NSRectEdgeMaxY];
    
}

- (void) setUpPopover {
    self.popover = [[NSPopover alloc] init];
    
    self.popover.contentViewController = self.writeVC;
    self.popover.behavior = NSPopoverBehaviorTransient;
    
//    self.popover.contentSize = NSMakeSize(300, 500);
}

-(WriteViewController *)writeVC{
    if (!_writeVC) {
        _writeVC = [[WriteViewController alloc] init];
    }
    return _writeVC;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
