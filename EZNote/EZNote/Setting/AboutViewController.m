//
//  AboutViewController.m
//  PreferencesWindowDemo
//
//  Created by Chris Shu on 2020/10/16.
//  Copyright © 2020 shushu. All rights reserved.
//

#import "AboutViewController.h"
#import "NSButton+PEZ.h"

@interface AboutViewController ()

@end



@implementation AboutViewController

-(void)loadView{
    
    NSView *view = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 300, 300)];
//    view.wantsLayer = YES;
//    view.layer.backgroundColor = [NSColor whiteColor].CGColor;
    self.view = view;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView{
    
    NSImageView *iconView = [[NSImageView alloc] init];
    [self.view addSubview:iconView];
    iconView.image = [NSImage imageNamed:@"logo100"];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(30);
    }];
    
    NSTextField *label0 = [[NSTextField alloc] init];
    [self.view addSubview:label0];
    label0.font = [NSFont boldSystemFontOfSize:18];
    label0.editable = NO;
    label0.stringValue = ProductName;
    
    NSTextField *label1 = [[NSTextField alloc] init];
    [self.view addSubview:label1];
    label1.editable = NO;
    NSString *version = [NSString stringWithFormat:@"Version %@ Build %@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"], [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];
    label1.stringValue = version;
    
    [label0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(iconView.mas_bottom).with.offset(25);
    }];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(label0.mas_bottom).with.offset(10);
    }];
    
    NSTextField *label2 = [[NSTextField alloc] init];
    [self.view addSubview:label2];
//    label2.font = [NSFont boldSystemFontOfSize:16];
    label2.editable = NO;
    label2.stringValue = @"反馈建议至：dev_shu@163.com";
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(label1.mas_bottom).with.offset(25);
    }];
     
    
    [label0 ezLabelStyle];
    [label1 ezLabelStyle];
    [label2 ezLabelStyle];
}

#pragma mark - MASPreferencesViewController

- (NSString *)viewIdentifier {
    return self.className;
}

- (NSString *)toolbarItemLabel {
    return @"关于";
}

- (NSImage *)toolbarItemImage {
    return [NSImage imageNamed:NSImageNameInfo];
}

- (BOOL)hasResizableWidth {
    return NO;
}

- (BOOL)hasResizableHeight {
    return NO;
}
@end
