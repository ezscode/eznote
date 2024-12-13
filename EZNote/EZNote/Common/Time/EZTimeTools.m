//
//  EZTimeTools.m
//  kyExpress_Internal
//
//  Created by MelissaShu on 17/8/18.
//  Copyright © 2017年 kyExpress. All rights reserved.
//

#import "EZTimeTools.h"


@implementation NSDateFormatter (PEZ)

- (void)setFormatWithStyle:(EZTimeStyle)style{
    
    switch (style) {
        case EZTimeStyleWhole:
            [self setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            break;
            
        case EZTimeStyleYMDHM:
            [self setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
            
        case EZTimeStyleYMD:
            [self setDateFormat:@"yyyy-MM-dd"];
            break;
            
        case EZTimeStyleYM:
            [self setDateFormat:@"yyyy-MM"];
            break;
            
        case EZTimeStyleMD:
            [self setDateFormat:@"MM-dd"];
            break;
            
        case EZTimeStyleHMS:
            [self setDateFormat:@"HH:mm:ss"];
            break;
            
        case EZTimeStyleHM:
            [self setDateFormat:@"HH:mm"];
            break;
            
        default:
            break;
    }
    
}

@end


@interface EZTimeTools()

@end


@implementation EZTimeTools

+ (NSString *)getStrFromDate:(NSDate *)date withStyle:(EZTimeStyle)style{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setFormatWithStyle:style];
    
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}

+ (NSDate *)getDateFromStr:(NSString *)str withStyle:(EZTimeStyle)style{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setFormatWithStyle:style];
    
    NSDate *date =[dateFormatter dateFromString:str];
    
    return date;
}


#pragma  mark －获取今天的日期
+ (NSString *)getTodayWithStyle:(EZTimeStyle)style{
    
    NSDate * senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setFormatWithStyle:style];
    
    return [dateformatter stringFromDate:senddate];
}


#pragma mark - 获取本月第一天
+ (NSString *)getFirstDayForCurrentMonthWithStyle:(EZTimeStyle)style{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setFormatWithStyle:style];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:comps.year];
    [adcomps setMonth:comps.month];
    [adcomps setDay:1];
    
    NSDate *newdate = [calendar dateFromComponents:adcomps];
    NSString *dateString = [dateFormatter stringFromDate:newdate];
    NSLog(@"dateString : %@",dateString);
    return dateString;
}


#pragma mark - 获取上个月今天
+ (NSString *)getAMonthAgo{
    NSDate *oneData = [NSDate dateWithTimeInterval:-60 * 60 * 24 *30 sinceDate:[NSDate date]];
    
    return [EZTimeTools getStrFromDate:oneData withStyle:EZTimeStyleYMD];
}




@end
