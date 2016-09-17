//
//  PLEnterPinWindow.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLEnterPinWindow.h"


@implementation PLEnterPinWindow

+ (instancetype)pinWindow
{
    PLEnterPinWindow *pinWindow = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"EnterPin" bundle:nil];
    pinWindow.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"enterPinRootController"];
    pinWindow.hidden = NO;
    return pinWindow;
}

-(void)dealloc
{
    NSLog(@"dealloc pin windows");
}
// add some methods for aniation here?

@end
