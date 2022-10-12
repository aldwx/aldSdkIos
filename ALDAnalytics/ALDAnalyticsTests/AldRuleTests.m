//
//  AldRuleTests.m
//  AldAnalyticsTests
//
//  Created by MC on 2022/10/12.
//

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "AldRule.h"

@interface AldRuleTests : XCTestCase

@property (nonatomic, strong) AldRule *rule;

@end

@implementation AldRuleTests

- (void)setUp {
    _rule = [[AldRule alloc] init];
}

- (void)tearDown {
    _rule = nil;
}

- (void)testPredefinedEventName {
    XCTAssertTrue([[self.rule checkPredefinedWithEventName:@"Ald_123qwe"] isEqualToString:AldRuleOK]);
    XCTAssertTrue(![[self.rule checkPredefinedWithEventName:@"123qwe"] isEqualToString:AldRuleOK]);
}

- (void)testPredefinedProperties {
    BOOL isEqual = [[self.rule checkPredefinedWithProperties:@{@"ald_name": @"ald", @"ald_age": @12, @"ald_": @"_"}] isEqualToString:AldRuleOK];
    XCTAssertTrue(isEqual);
//    XCTAssertTrue([[self.rule checkPredefinedWithProperties:@{@"ald_name": @"ald", @"ald_age": @12, @"ald_": @"_"}] isEqualToString:AldRuleOK]);
    isEqual = [[self.rule checkPredefinedWithProperties: @{@"ald_name": @"ald", @"age": @12, @"ald_": @"_"}] isEqualToString:AldRuleOK];
    XCTAssertFalse(isEqual);
//    XCTAssertTrue(![[self.rule checkPredefinedWithProperties: @{@"ald_name": @"ald", @"age": @12, @"ald_": @"_"}] isEqualToString:AldRuleOK]);
}

- (void)testEventName {
    XCTAssertTrue(![[self.rule checkWithEventName:@"Ald_123qwe"] isEqualToString:AldRuleOK]);
    XCTAssertTrue(![[self.rule checkWithEventName:@"123qwe"] isEqualToString:AldRuleOK]);
    XCTAssertTrue([[self.rule checkWithEventName:@"qwe123_"] isEqualToString:AldRuleOK]);
}

- (void)testProperties {
    BOOL isEqual = [[self.rule checkWithProperties: @{@"ald_name": @"ald", @"ald_age": @12, @"ald_": @"_"}] isEqualToString:AldRuleOK];
    XCTAssertFalse(isEqual);
//    XCTAssertTrue(![[self.rule checkWithProperties: @{@"ald_name": @"ald", @"ald_age": @12, @"ald_": @"_"}] isEqualToString:AldRuleOK]);
    isEqual = [[self.rule checkWithProperties: @{@"name": @"ald", @"age": @12, @"ald_": @"_"}] isEqualToString:AldRuleOK];
    XCTAssertFalse(isEqual);
//    XCTAssertTrue(![[self.rule checkWithProperties: @{@"name": @"ald", @"age": @12, @"ald_": @"_"}] isEqualToString:AldRuleOK]);
    isEqual = [[self.rule checkWithProperties: @{@"name": @"ald", @"age": @12}] isEqualToString:AldRuleOK];
    XCTAssertTrue(isEqual);
//    XCTAssertTrue([[self.rule checkWithProperties: @{@"name": @"ald", @"age": @12}] isEqualToString:AldRuleOK]);
}

@end
