//
//  PLEnterPinWindow.h
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PLPinAppearance;

@interface PLEnterPinWindow : UIWindow

+ (instancetype)defaultInstance;

@property (nonatomic, strong) PLPinAppearance *pinAppearance;

-(void)showAnimated:(BOOL)animated;
-(void)hideAnimated:(BOOL)animated;


@end
