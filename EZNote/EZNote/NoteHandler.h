//
//  NoteHandler.h
//  StatusNote
//
//  Created by Chris Shu on 2020/10/15.
//  Copyright © 2020 shushu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoteHandler : NSObject

+ (NoteHandler *)sharedInstance;

- (NSString *)getTodayMDPath;
        
- (NSString *)getNotesPath;

- (NSString *)getThisMonthMDPath;

@end

NS_ASSUME_NONNULL_END
