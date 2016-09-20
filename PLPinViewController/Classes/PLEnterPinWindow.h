//
//  PLEnterPinWindow.h
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLEnterPinWindow : UIWindow

+ (instancetype)defaultInstance;

-(void)showAnimated:(BOOL)animated;
-(void)hideAnimated:(BOOL)animated;


@end
