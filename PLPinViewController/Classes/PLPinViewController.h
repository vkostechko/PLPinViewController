//
//  PLPinViewController.h
//  Pods
//
//  Created by Ash Thwaites on 17/09/2016.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PLPinViewControllerAction) {
    PLPinViewControllerActionCreate = 0,
    PLPinViewControllerActionChange,
    PLPinViewControllerActionEnter
};

@class PLPinViewController;

@protocol PLPinViewControllerDelegate <NSObject>

@optional

- (void)PLPinViewControllerDidCancel:(PLPinViewController *)controller;
- (void)PLPinViewControllerDidChangePasscode:(PLPinViewController *)controller;
- (void)PLPinViewControllerDidEnterAlternativePasscode:(PLPinViewController *)controller;
- (void)PLPinViewControllerDidEnterPasscode:(PLPinViewController *)controller;
- (void)PLPinViewControllerDidSetPasscode:(PLPinViewController *)controller;
- (void)PLPinViewControllerDidFailToEnterPasscode:(NSInteger)attempts;

@end

@interface PLPinViewController : UINavigationController

@property (weak) id<PLPinViewControllerDelegate> pinDelegate;

+ (instancetype)pinControllerWithTitle:(NSString *)title action:(PLPinViewControllerAction)action;

@end
