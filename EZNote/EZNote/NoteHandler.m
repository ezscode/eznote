//
//  NoteHandler.m
//  StatusNote
//
//  Created by Chris Shu on 2020/10/15.
//  Copyright © 2020 shushu. All rights reserved.
//

#import "NoteHandler.h"

@implementation NoteHandler


static NoteHandler *instance = nil;

+ (NoteHandler *)sharedInstance{
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        instance = [[self alloc]init];
        
//        [[NSNotificationCenter defaultCenter] addObserver:instance selector:@selector(refreshUserStatus) name:kNotificationRefreshUserStatus object:nil];
    });
    return instance;
}


- (void)saveNote:(NSString *)str{
    
    
    
}


- (void)saveTodayNotes:(NSArray *)str{
    
    
}

#pragma mark - 修改保存地址
- (void)changeSavePath:(NSString *)path{
    
    
}

#pragma mark - 设置开机自启动
- (void)setAutoLaunch:(BOOL)shouldLaunch{
    
    
}



- (NSString *)getNotesPath{
    NSString *documentPath =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *notesPath = [documentPath stringByAppendingPathComponent:@"eznote"];
    
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    if (![fm fileExistsAtPath:notesPath isDirectory:&isDirectory]) {
       NSError *error;
        [fm createDirectoryAtPath:notesPath withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            NSLog(@"%@",error);
            return nil;
        }
    }
    
    if (!isDirectory) {
        NSError *error;
         [fm createDirectoryAtPath:notesPath withIntermediateDirectories:YES attributes:nil error:&error];
         if (error) {
             NSLog(@"%@",error);
             return nil;
         }
    }
    
    return notesPath;
}


- (NSString *)getTodayMDPath{
    
    NSString *notesPath = [self getNotesPath];
     
    NSString *today = [EZTimeTools getTodayWithStyle:EZTimeStyleYMD];
    NSString *mdPath = [NSString stringWithFormat:@"%@/%@.md", notesPath, today];
    
    return mdPath;
}

- (NSString *)getThisMonthMDPath{
    
    NSString *notesPath = [self getNotesPath];
     
    NSString *month = [EZTimeTools getTodayWithStyle:EZTimeStyleYM];
    NSString *mdPath = [NSString stringWithFormat:@"%@/%@.md", notesPath, month];
    
    return mdPath;
}


@end
