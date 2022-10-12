//
//  AldAnalytics.m
//  AldAnalytics
//
//  Created by MC on 2022/10/12.
//

#import "AldAnalytics.h"
#import "SensorsAnalyticsSDK.h"
#import "AldRule.h"

@implementation AldAnalytics

+ (void)initSDKWithAppKey:(NSString *)appKey launchOptions:(id)launchOptions {
    NSString *serverURL = [NSString stringWithFormat:@"https://slog.aldwx.com/d.html?ak=%@", appKey];
    [self initSASDKWithServerURL:serverURL launchOptions:launchOptions];
}

+ (void)initSASDKWithServerURL:(NSString *)serverURL launchOptions:(id)launchOptions {
    SAConfigOptions *options = [[SAConfigOptions alloc]initWithServerURL:serverURL
                                                           launchOptions:launchOptions];
    options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppViewScreen;
    options.enableLog = YES;
    options.enableTrackPush = YES;
    options.enableTrackAppCrash = YES;
    options.enableTrackPageLeave = YES;
    [SensorsAnalyticsSDK startWithConfigOptions:options];
}

+ (void)trackAppInstall {
    [SensorsAnalyticsSDK.sharedInstance trackAppInstallWithProperties:nil];
}

+ (void)trackAppInstallWithProperties:(NSDictionary *)properties {
    [SensorsAnalyticsSDK.sharedInstance trackAppInstallWithProperties:properties disableCallback:NO];
}

+ (void)trackEvent:(NSString *)event properties:(NSDictionary *)properties {
    AldRule *rule = [[AldRule alloc] init];
    NSString *result = [rule checkWithEventName:event];
    if (![result isEqualToString:AldRuleOK]) {
        NSLog(@"[trackEvent] 自定义事件：%@", result);
        return;
    }
    result = [rule checkWithProperties:properties];
    if (![result isEqualToString:AldRuleOK]) {
        NSLog(@"[trackEvent] 自定义属性：%@", result);
        return;
    }
    [[SensorsAnalyticsSDK sharedInstance] track:event withProperties:properties];
}

+ (void)trackPredefined:(NSString *)event properties:(NSDictionary *)properties {
    AldRule *rule = [[AldRule alloc] init];
    NSString *result = [rule checkPredefinedWithEventName:event];
    if (![result isEqualToString:AldRuleOK]) {
        NSLog(@"[trackPredefined] 预定义事件：%@", result);
        return;
    }
    result = [rule checkPredefinedWithProperties:properties];
    if (![result isEqualToString:AldRuleOK]) {
        NSLog(@"[trackPredefined] 预定义属性：%@", result);
        return;
    }
    [[SensorsAnalyticsSDK sharedInstance] track:event withProperties:properties];
}

@end
