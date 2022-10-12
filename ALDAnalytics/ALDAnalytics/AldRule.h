//
//  AldRule.h
//  AldAnalytics
//
//  Created by MC on 2022/10/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const AldRuleOK;

@interface AldRule : NSObject

- (NSString *)checkPredefinedWithEventName:(NSString *)eventName;
- (NSString *)checkPredefinedWithProperties:(NSDictionary *)properties;

- (NSString *)checkWithEventName:(NSString *)eventName;
- (NSString *)checkWithProperties:(NSDictionary *)properties;

@end

NS_ASSUME_NONNULL_END
