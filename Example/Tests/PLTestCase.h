//
//  OBTestCase.h
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

@import XCTest;

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import <OCMock/OCMock.h>

@interface PLTestCase : XCTestCase

- (void)stubAndInvokeAlertActionWithTitle:title;

@end
