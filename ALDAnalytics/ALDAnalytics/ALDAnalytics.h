//
//  AldAnalytics.h
//  AldAnalytics
//
//  Created by MC on 2022/10/12.
//

#import <Foundation/Foundation.h>

//! Project version number for AldAnalytics.
FOUNDATION_EXPORT double AldAnalyticsVersionNumber;

//! Project version string for AldAnalytics.
FOUNDATION_EXPORT const unsigned char AldAnalyticsVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <AldAnalytics/PublicHeader.h>

@interface AldAnalytics : NSObject

+ (void)initSDKWithAppKey:(NSString *)appKey launchOptions:(id)launchOptions;

+ (void)initSASDKWithServerURL:(NSString *)serverURL launchOptions:(id)launchOptions;

+ (void)trackAppInstall;
+ (void)trackAppInstallWithProperties:(NSDictionary *)properties;

+ (void)trackEvent:(NSString *)event properties:(NSDictionary *)properties;
+ (void)trackPredefined:(NSString *)event properties:(NSDictionary *)properties;

@end
