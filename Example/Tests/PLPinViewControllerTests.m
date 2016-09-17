//
//  PLPinViewControllerTests.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//


#import "PLTestCase.h"
#import "PLPinViewController.h"
#import "PLRunLoopRunUntil.h"

@import PLForm;
@import PLPinViewController;

@interface PLPinViewControllerTests : PLTestCase
{
    PLPinViewController *vc;
}
@end

@implementation PLPinViewControllerTests

- (void)setUp {
    [super setUp];

    vc = [PLPinViewController pinControllerWithTitle:@"test" action:0];
    
    PLRunLoopRunUntil(2,YES,^{
        return (BOOL)([vc isViewLoaded] && vc.view.window);
    });
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testOutletsConnected {
    
    expect(vc).toNot.beNil();
    expect(vc).to.beKindOf([PLPinViewController class]);
}

-(void)testActionsConnected
{
}







@end
