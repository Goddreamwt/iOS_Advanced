//
//  _06__NSURLSession_block____Tests.m
//  006--NSURLSession的block回调队列Tests
//
//  Created by H on 2017/2/20.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface _06__NSURLSession_block____Tests : XCTestCase

@end

@implementation _06__NSURLSession_block____Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
