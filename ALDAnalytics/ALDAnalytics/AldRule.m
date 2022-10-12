//
//  AldRule.m
//  AldAnalytics
//
//  Created by MC on 2022/10/12.
//

#import "AldRule.h"

NSString * const AldRuleOK = @"ok";

@implementation AldRule

+ (NSRegularExpression *)regex {
    static dispatch_once_t onceToken;
    static NSRegularExpression *expression = nil;
    dispatch_once(&onceToken, ^{
        expression = [NSRegularExpression regularExpressionWithPattern:@"^[a-zA-Z][a-zA-Z0-9_]{0,65}$" options:0 error:NULL];
    });
    return expression;
}

- (BOOL)checkKey:(NSString *)key {
    if (AldRule.regex == nil) return YES;
    
    NSUInteger num = [AldRule.regex numberOfMatchesInString:key options:NSMatchingReportProgress range:NSMakeRange(0, key.length)];
    return num >= 1;
}

- (NSString *)checkKeyWord:(NSString *)key {
    if ([key isEqualToString:@"date"] ||
        [key isEqualToString:@"datetime"] ||
        [key isEqualToString:@"distinct_id"] ||
        [key isEqualToString:@"event"] ||
        [key isEqualToString:@"events"] ||
        [key isEqualToString:@"event_id"] ||
        [key isEqualToString:@"first_id"] ||
        [key isEqualToString:@"id"] ||
        [key isEqualToString:@"original_id"] ||
        [key isEqualToString:@"device_id"] ||
        [key isEqualToString:@"properties"] ||
        [key isEqualToString:@"second_id"] ||
        [key isEqualToString:@"time"] ||
        [key isEqualToString:@"user_id"] ||
        [key isEqualToString:@"users"] ||
        [key hasPrefix:@"user_group"] ||
        [key hasPrefix:@"user_tag"]) {
        return @"ERR_API_EVENT_ARGS_KEYWORDS";
    }
    return AldRuleOK;
}

- (NSString *)checkPredefinedWithEventName:(NSString *)eventName {
    if (![self checkKey:eventName]) {
        return @"ERR_API_EVENT_ARGS_WRONG";
    }
    if (![eventName hasPrefix:@"Ald"]) {
        return @"ERR_API_EVENT_ARGS_PREDIFINE_WRONG";
    }
    return AldRuleOK;
}

- (NSString *)checkPredefinedWithProperties:(NSDictionary *)properties {
    if (properties == nil) {
        return AldRuleOK;
    }
    
    for (NSString *key in properties) {
        if (![self checkKey:key]) {
            return @"ERR_API_EVENT_ARGS_WRONG";
        }
        if (![key hasPrefix:@"ald_"]) {
            return @"ERR_API_PROPS_ARGS_PREDIFINE_WRONG";
        }
    }
    return AldRuleOK;
}

- (NSString *)checkWithEventName:(NSString *)eventName {
    if (![self checkKey:eventName]) {
        return @"ERR_API_EVENT_ARGS_WRONG";
    }
    if ([eventName hasPrefix:@"Ald"]) {
        return @"ERR_API_EVENT_ARGS_CUSTOM_WRONG";
    }
    return [self checkKeyWord:eventName];
}

- (NSString *)checkWithProperties:(NSDictionary *)properties {
    if (properties == nil) {
        return AldRuleOK;
    }
    
    for (NSString *key in properties) {
        if (![self checkKey:key]) {
            return @"ERR_API_EVENT_ARGS_WRONG";
        }
        if ([key hasPrefix:@"ald_"]) {
            return @"ERR_API_PROPS_ARGS_CUSTOM_WRONG";
        }
    }
    return AldRuleOK;
}

@end
