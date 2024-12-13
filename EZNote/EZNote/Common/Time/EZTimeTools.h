//
//  EZTimeTools.h
//  kyExpress_Internal
//
//  Created by MelissaShu on 17/8/18.
//  Copyright © 2017年 kyExpress. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark -- 时间格式
typedef NS_ENUM(NSUInteger, EZTimeStyle) {
    
    EZTimeStyleWhole = 0,  //年-月-日 时:分:秒 yyyy-MM-dd HH:mm:ss
    EZTimeStyleYMDHM,  //年-月-日 时：分 yyyy-MM-dd HH:mm
    
    EZTimeStyleYMD,//年-月-日 yyyy-MM-dd
    EZTimeStyleYM,//年-月  yyyy-MM
    EZTimeStyleMD,//月-日 MM-dd
    
    EZTimeStyleHMS,  //时:分:秒 HH:mm:ss
    EZTimeStyleHM //时:分 HH:mm
};

@interface NSDateFormatter (PEZ)

- (void)setFormatWithStyle:(EZTimeStyle)style;

@end


@interface EZTimeTools : NSObject

+ (NSString *)getStrFromDate:(NSDate *)date withStyle:(EZTimeStyle)style;
+ (NSDate *)getDateFromStr:(NSString *)str withStyle:(EZTimeStyle)style;


#pragma mark - 获取本月第一天
+ (NSString *)getFirstDayForCurrentMonthWithStyle:(EZTimeStyle)style;

#pragma  mark －获取今天的日期
+ (NSString *)getTodayWithStyle:(EZTimeStyle)style;

#pragma mark - 获取上个月今天
+ (NSString *)getAMonthAgo;

@end
