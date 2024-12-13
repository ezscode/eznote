//
//  WriteViewController.m
//  StatusNote
//
//  Created by Chris Shu on 2020/10/15.
//  Copyright © 2020 shushu. All rights reserved.
//

#import "WriteViewController.h"
#import <Masonry.h>
#import <MJExtension.h>
#import "NSButton+PEZ.h"
#import "PreferencesWindowController.h"

@interface WriteViewController ()<NSTextFieldDelegate>

@property (nonatomic, strong) NSTextField *inputField;
@property (nonatomic, strong) NSButton *openButton;
@property (nonatomic, strong) NSButton *settingButton;

@end

@implementation WriteViewController

-(void)loadView{
    
    NSView *view = [[NSView alloc]initWithFrame:CGRectMake(0, 0, 300, 190)];
//           view.wantsLayer = YES;
//           view.layer.backgroundColor = [NSColor yellowColor].CGColor;
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self setupViews];
}

- (void)setupViews{
    
    [self inputField];
    
    [self settingButton];
    [self openButton];
}


#pragma mark - NSTextFieldDelegate

    //返回 YES 时，delete、tab 这些方法调用失败。所以需要返回 NO。
- (BOOL)control:(NSControl *)control
       textView:(NSTextView *)textView
doCommandBySelector:(SEL)commandSelector{
    
    NSString *selector = NSStringFromSelector(commandSelector);    NSLog(@"selector : %@", selector);
    
    NSTextField *field = (NSTextField *)control;
        //     NSLog(@"control : %@, textView : %@", control, textView);
    
        //    NSLog(@"-- (%ld) : %@",field.tag,field.stringValue);
    
        //点击换行，提交代码
    if ([selector isEqualToString:@"insertNewline:"]) {
//         NSLog(@"-- (%ld) : %@",field.tag,field.stringValue);
//        [self onEnsure];
        
        NSString *banana = self.inputField.stringValue;
        self.inputField.stringValue = @"";
        NSLog(@"-- onEnsure : %@", banana);
        [self writeNotes:banana];
        return YES;
    }
    
    return NO;
}


- (void)onEnsure{
    
    NSString *banana = self.inputField.stringValue;
    NSLog(@"-- onEnsure : %@", banana);
    
    
    self.inputField.stringValue = @"";
    
    
//    if ([StringTools isBlankString:banana]) {
//
//        [[MacHud sharedInstance] showMessage:@"请输入内容" type:HUDType_Error inView:self.window.contentView];
//        return;
//    }
    
//    if ([self.dataArray containsObject:banana]) {
        
//        [[MacHud sharedInstance] showMessage:@"已存在相同数据" type:HUDType_Error inView:self.window.contentView];
//        return;
        
//    }
    
//    [self.dataArray addObject:banana];
//    self.statusLabel.stringValue = banana;
//
//    NSString *encryptString = [AESTools encryptStringWithString:banana];
//
//    NSMutableArray *array = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] arrayForKey:kStoredData]];
//    if (![array containsObject:encryptString]) {
//        [array addObject:encryptString];
//    }
//
//    if (array.count > 0) {
//        [[NSUserDefaults standardUserDefaults] setObject:array forKey:kStoredData];
//    }
    
//    [self.tableView reloadData];
    
}


- (void)onOpen{
     
//    NSString *mdPath = [[NoteHandler sharedInstance] getTodayMDPath];
    NSString *mdPath = [[NoteHandler sharedInstance] getThisMonthMDPath];
    
   [[NSWorkspace sharedWorkspace] selectFile:mdPath inFileViewerRootedAtPath:nil];
    
}


- (void)onSetting{
    
    [PreferencesWindowController.shared showWindow:nil];
    
}





- (void)writeNotes:(NSString *)note{
   
    
    NSString *now = [EZTimeTools getTodayWithStyle:EZTimeStyleWhole];
    NSString * str = [NSString stringWithFormat:@"\n%@\n%@\n\n", now, note];

    NSData *data =[str dataUsingEncoding:NSUTF8StringEncoding];

    NSString *mdPath = [[NoteHandler sharedInstance] getThisMonthMDPath];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:mdPath]) {
        [[NSFileManager defaultManager] createFileAtPath:mdPath contents:data attributes:nil];
    }else{
        // 追加内容
        NSFileHandle *wirteFileHandle =[NSFileHandle fileHandleForWritingAtPath:mdPath];

        //设置偏移量   如果不设置偏移量 系统默认从文件一开始添加数据
        NSError *offsetErr;
         unsigned long long * offset = NULL;
        [wirteFileHandle seekToEndReturningOffset:offset error:&offsetErr]; //设置偏移量跳到文件的末尾
        [wirteFileHandle writeData:data]; //写入数据
        [wirteFileHandle closeFile]; //关闭文件
    }
     
//
//    [[NSWorkspace sharedWorkspace] selectFile:mdPath inFileViewerRootedAtPath:nil];
     
}
 

#pragma mark - Lazy

-(NSTextField *)inputField{
    if (!_inputField) {
        _inputField = [[NSTextField alloc] init];
        [self.view addSubview:_inputField];
        [_inputField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(40);
            make.leading.mas_equalTo(15);
            make.trailing.mas_equalTo(-15);
            make.height.mas_equalTo(135);
            
        }];
        _inputField.delegate = self;
    }
    return _inputField;
}

-(NSButton *)openButton{
    if (!_openButton) {
        _openButton = [[NSButton alloc] init];
        [self.view addSubview:_openButton];
        [_openButton ezPureImageBtn:[NSImage imageNamed:@"finder"]];
    
        [_openButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.settingButton);
            make.trailing.equalTo(self.settingButton.mas_leading).with.offset(-10);
            make.size.equalTo(self.settingButton);
        }];
        [_openButton ezAddTarget:self andAction:@selector(onOpen)];
    }
    return _openButton;
}

-(NSButton *)settingButton{
    if (!_settingButton) {
        _settingButton = [[NSButton alloc] init];
        [self.view addSubview:_settingButton];
        [_settingButton ezPureImageBtn:[NSImage imageNamed:@"setting"]];
        [_settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.trailing.mas_equalTo(-15);
            make.size.mas_equalTo(NSMakeSize(20, 20));
        }];
        [_settingButton ezAddTarget:self andAction:@selector(onSetting)];
    }
    return _settingButton;
}


@end
