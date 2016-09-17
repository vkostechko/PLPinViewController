//
//  PLTestCase.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//


#import "PLTestCase.h"
#import "PLRunLoopRunUntil.h"

@interface PLTestCase ()

@end

@implementation PLTestCase

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}



// some posts suggested we may need to all stopMocking explicitly at some point..
- (void)stubAndInvokeAlertActionWithTitle:title {
    id alertControllerMock = OCMClassMock([UIAlertController class]);
    OCMStub([[alertControllerMock ignoringNonObjectArgs] alertControllerWithTitle:[OCMArg any] message:[OCMArg any] preferredStyle:0]).andReturn(alertControllerMock);
    
    id alertActionMock = OCMClassMock([UIAlertAction class]);
    OCMStub([[alertActionMock ignoringNonObjectArgs] actionWithTitle:title style:0 handler:[OCMArg any]]).andDo(^(NSInvocation *invocation) {
        void (^handler)(UIAlertAction *action);
        [invocation getArgument:&handler atIndex:4];
        if (handler != nil) {
            handler(nil);
        }
    }).andReturn(alertActionMock);
}

@end
