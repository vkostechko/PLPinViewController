//
//  PLSlideTransition.h
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PLSlideTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) UINavigationControllerOperation operation;

@end
