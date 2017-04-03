//
//  PLPinControllerSeque.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLPinControllerSeque.h"
#import "PLPinViewController.h"

@implementation PLPinControllerSeque

- (instancetype)initWithIdentifier:(nullable NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    if (self = [super initWithIdentifier:identifier source:source destination:destination]) {
        self.animated = (source.childViewControllers.count >0);
    }
    return self;    
}

- (void)perform {
    PLPinViewController *sourceViewController = self.sourceViewController;
    if ([sourceViewController isKindOfClass:[PLPinViewController class]]) {
        [sourceViewController presentContainedViewController:self.destinationViewController animated:self.animated];
    }
}

@end
