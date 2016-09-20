//
//  PLEnterPinWindow.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLEnterPinWindow.h"
#import "PLPinViewController.h"

@interface PLEnterPinWindow ()

@end

@implementation PLEnterPinWindow

+ (instancetype)defaultInstance {
    static PLEnterPinWindow *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        NSBundle *podBundle = [NSBundle bundleForClass:[self class]];
        NSURL *bundleUrl = [podBundle URLForResource:@"PLPinViewController" withExtension:@"bundle"];
        NSBundle *bundle = [NSBundle bundleWithURL:bundleUrl];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PLPinViewController" bundle:bundle];

        PLPinViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"PLPinViewController"];
        sharedInstance.rootViewController = vc;

    });
    return sharedInstance;
}

-(void)dealloc
{
    NSLog(@"dealloc pin windows");
}

-(void)showAnimated:(BOOL)animated
{
    if (animated)
    {
        self.alpha = 0.0;
        self.hidden = NO;
        [self.window makeKeyAndVisible];
        [UIView animateWithDuration:0.4 animations:^{
            self.alpha = 1.0;
        } completion:^(BOOL finished) {
            // do anything here?
        }];
    }
    else
    {
        self.alpha = 1.0;
        self.hidden = NO;
        [self makeKeyAndVisible];
    }
}

-(void)hideAnimated:(BOOL)animated
{
    // need to find the main window of the app delegate
    if (animated)
    {
        [UIView animateWithDuration:0.4 animations:^{
            self.alpha = 0.0;
        } completion:^(BOOL finished) {
            // get the original window.. (bit of an assumption)
            [[[[UIApplication sharedApplication] windows] objectAtIndex:0] makeKeyAndVisible];

            self.hidden = YES;
            
            PLPinViewController *vc = (PLPinViewController*)self.rootViewController;
            [vc presentContainedViewController:nil animated:NO];
        }];
    }
    else
    {
        self.alpha = 0.0;
        self.hidden = YES;
        // get the original window.. (bit of an assumption)
        [[[[UIApplication sharedApplication] windows] objectAtIndex:0] makeKeyAndVisible];
        
        PLPinViewController *vc = (PLPinViewController*)self.rootViewController;
        [vc presentContainedViewController:nil animated:NO];
    }
}


@end
