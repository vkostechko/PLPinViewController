//
//  PLEnterPinViewController.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLEnterPinViewController.h"
#import "PLFormPinField.h"


@import PLForm;

@interface PLEnterPinViewController () <PLFormElementDelegate>
{
    PLFormPinFieldElement *pinElement;
}
@property (weak, nonatomic) IBOutlet PLFormPinField *pinField;
@property (weak, nonatomic) IBOutlet UIImageView *illustration;
@property (weak, nonatomic) IBOutlet UIView *errorView;

@end


@implementation PLEnterPinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // lets hook up the element
    pinElement = [PLFormPinFieldElement pinFieldElementWithID:0 pinLength:4 delegate:self];
    pinElement.dotSize = 10;
    [self.pinField updateWithElement:pinElement];
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    self.illustration.hidden = (result.height == 480);
    self.errorView.alpha = 0.0f;
}

-(void)dealloc
{
    NSLog(@"dealloc pin controller");
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.pinField becomeFirstResponder];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    pinElement.value = nil;
    [self.pinField updateWithElement:pinElement];
}

- (void)formElementDidChangeValue:(PLFormElement *)formElement;
{
    // call a delegate to check if the pin code is ok
/*
    // lets defer this for a fraction so we allow the dot of the last key press to appear
    if ([PLClientCache unlockWithPassword:pinElement.value])
    {
        // we may need to set the push token as the cache may have been locked when the token arrived
        AppDelegate *appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [appDel dismissEnterPin];
    }
    else
    {
        [self incorrectPin];
    }
*/
}

-(void)incorrectPin
{
    // we need to display incorrect pin
    self.errorView.alpha = 0.0f;
    [[UIApplication sharedApplication]beginIgnoringInteractionEvents];
    [UIView animateWithDuration:0.3f animations:^{
        self.errorView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication]endIgnoringInteractionEvents];
        
        pinElement.value = nil;
        [self.pinField updateWithElement:pinElement];
        [self.pinField becomeFirstResponder];
        
        [UIView animateWithDuration:0.3f
                              delay:1.0f
                            options:0
                         animations:^{
            self.errorView.alpha = 0.0f;
        } completion:^(BOOL finished) {
        }];
        
    }];
    
    return;

}

- (IBAction)logoutPressed:(id)sender {
    
    [self.view endEditing:YES];
    
    // notify delegate that logout pressed
/*
    [SVProgressHUD showWithStatus:@"Checking"];
    [PLUser logoutWithCompletion:^(NSError *error)
     {
         [[YPDataModelStack defaultStack] reloadPersistenceController];
         [SVProgressHUD dismiss];
         if (error)
         {
             [self presentViewController:[UIAlertController alertWithError:error] animated:YES completion:nil];
         }
         else
         {
             [self.rootContainerViewController  presentRegister];
             AppDelegate *appDel = (AppDelegate*)[UIApplication sharedApplication].delegate;
             [appDel dismissEnterPin];
         }
     }];
*/
}

@end
