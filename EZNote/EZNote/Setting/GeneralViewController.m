//
//  GeneralViewController.m
//  PreferencesWindowDemo
//
//  Created by Chris Shu on 2020/10/16.
//  Copyright © 2020 shushu. All rights reserved.
//

#import "GeneralViewController.h"
#import <ServiceManagement/ServiceManagement.h>
//#import <MASShortcut/Shortcut.h>

@interface GeneralViewController ()


@property (nonatomic, strong) NSButton *launchBtn;



@end

@implementation GeneralViewController


static NSString *const ShortcutKey_1 = @"SelectionShortcutKey";

-(void)loadView{
    
    NSView *view = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 300, 300)];
//    view.wantsLayer = YES;
//    view.layer.backgroundColor = [NSColor redColor].CGColor;
    self.view = view;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.shortcutView.style = MASShortcutViewStyleTexturedRect;
    
//    [self.shortcutView setAssociatedUserDefaultsKey:SelectionShortcutKey];
    
    [self setupViews];
    
    BOOL shouldLauch = [[NSUserDefaults standardUserDefaults] boolForKey:kShouldAutoLaunch];
    
    self.launchBtn.state = shouldLauch;
    
    
    
}

-(void)viewWillAppear{
    
    [super viewWillAppear];
    
}

- (void)setupViews{
    
    NSButton *checkBox = [NSButton checkboxWithTitle:@"开机自启动" target:self action:@selector(onLaunch:)];
    [self.view addSubview:checkBox];
    [checkBox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.leading.mas_equalTo(80);
    }];
    self.launchBtn = checkBox;
    
   
    NSButton *exitBtn = [[NSButton alloc] init];
    [exitBtn setBezelStyle:NSBezelStyleRegularSquare];
    [exitBtn setButtonType:NSButtonTypeMomentaryLight];
    exitBtn.title = @"退出";
    exitBtn.target = self;
    exitBtn.action = @selector(onExist);
    
    [self.view addSubview:exitBtn];
    [exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-30);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(NSMakeSize(100, 28));
    }];
    
    NSPopUpButton *intervalBtn = [[NSPopUpButton alloc] init];
    [self.view addSubview:intervalBtn];
    [intervalBtn addItemsWithTitles:@[@"每月",@"每天"]];
    
    [intervalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(checkBox.mas_bottom).with.offset(15);
        make.leading.mas_equalTo(80);
        make.size.mas_equalTo(NSMakeSize(100, 30));
    }];
}

- (void)onLaunch:(NSButton *)sender{
    NSLog(@"onLaunch : %ld", sender.state);
    
    if (sender.state == 0) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:kShouldAutoLaunch];
        if (SMLoginItemSetEnabled((__bridge CFStringRef)BundleID_LoginItem, false)){
            NSLog(@"SMLoginItemSet disnable success!");
        }else{
            
            NSLog(@"SMLoginItemSet disnable failed!");
        }
        
    }else{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kShouldAutoLaunch];
        if (SMLoginItemSetEnabled((__bridge CFStringRef)BundleID_LoginItem, true)){
            
            NSLog(@"SMLoginItemSetEnabled success!");
        }else{
            
            NSLog(@"SMLoginItemSetEnabled failed!");
        }
    }
    
  
    
}

- (void)onExist{
    exit(0);
}

//-(MASShortcutView *)shortcutView{
//    if (!_shortcutView) {
//        _shortcutView = [[MASShortcutView alloc] init];
//        [self.view addSubview:_shortcutView];
//        _shortcutView.frame = NSMakeRect(100, 100, 100, 40);
//        _shortcutView.wantsLayer = YES;
//        _shortcutView.layer.backgroundColor = [NSColor redColor].CGColor;
//     }
//    return _shortcutView;
//}

#pragma mark - MASPreferencesViewController

- (NSString *)viewIdentifier {
    return self.className;
}

- (NSString *)toolbarItemLabel {
    return @"通用";
}

- (NSImage *)toolbarItemImage {
    return [NSImage imageNamed:NSImageNameAdvanced];
}

- (BOOL)hasResizableWidth {
    return NO;
}

- (BOOL)hasResizableHeight {
    return NO;
}
@end
