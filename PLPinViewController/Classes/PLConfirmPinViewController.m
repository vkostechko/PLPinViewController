//
//  PLConfirmPinViewController.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLConfirmPinViewController.h"
#import "PLFormPinField.h"

@import PLForm;

@interface PLConfirmPinViewController () <PLFormElementDelegate>
{
    PLFormPinFieldElement *pinElement;
}
@property (weak, nonatomic) IBOutlet PLFormPinField *pinField;
@property (weak, nonatomic) IBOutlet UIImageView *illustration;

@end


@implementation PLConfirmPinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // lets hook up the element
    pinElement = [PLFormPinFieldElement pinFieldElementWithID:0 pinLength:4 delegate:self];
    pinElement.dotSize = 10;
    [self.pinField updateWithElement:pinElement];
    
    [self.pinField becomeFirstResponder];
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    self.illustration.hidden = (result.height == 480);
    
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem yvp_backBarButtonItemWithTarget:self action:@selector(popBack)];
}

-(void)popBack
{
    [self performSegueWithIdentifier:@"unwindToCreatPin" sender:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)formElementDidChangeValue:(PLFormElement *)formElement;
{
    // check if the pin is the same as the one we were given
    // if its not unwind, if it is then open the app
    
    // inform delegate that pin was ok
/*
    if ([pinElement.value isEqualToString:self.pin] )
    {
        // the pin matches so lets open the app
        [PLClientCache setPassword:pinElement.value];
        [[YPDataModelStack defaultStack].clientCache save];

        // just in case we have been a user before fetch some other data
        [YPNotification fetchNextPageWithCompletion:nil];
        [YPImage fetchFirstPageForUser:[YPDataModelStack defaultStack].clientCache.currentUser completion:nil];
        
        if ([YPFeedImage shouldFetchNextpage])
        {
            [YPFeedImage fetchFirstPageWithCompletion:nil];
        }
        
        // if we are "modal" then we are changing pin not creaeting pin so the flow is different
        if (self.navigationController.presentingViewController != nil)
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        else
        {
            // we may not need to ask for permissions becuase we could be re-logging in.
            // lets check our permission status..
            if (([PLPermissions pushNotificationPermissionStatus] == PLPermissionsStatusAuthorized) &&
                ([PLPermissions contactsPermissionStatus] == PLPermissionsStatusAuthorized))
            {
                [self importAddressBook];
            }
            else
            {
                [[self rootContainerViewController] presentPermissions];
            }
        }
    }
    else
    {
        [self performSegueWithIdentifier:@"unwindToCreatPin" sender:nil];
    }
*/
}


@end
