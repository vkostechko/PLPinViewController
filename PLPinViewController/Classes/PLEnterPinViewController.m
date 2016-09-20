//
//  PLEnterPinViewController.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLEnterPinViewController.h"
#import "PLFormPinField.h"
#import "PLPinViewController.h"
#import "PLEnterPinWindow.h"


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
    PLPinViewController *vc = (PLPinViewController*)[PLEnterPinWindow defaultInstance].rootViewController;
    if ([vc.pinDelegate respondsToSelector:@selector(pinViewController:shouldAcceptPin:)])
    {
        if ([vc.pinDelegate pinViewController:self shouldAcceptPin:pinElement.value])
        {
            [self correctPin];
        }
        else
        {
            [self incorrectPin];
        }
    }
}

-(void)correctPin
{
    PLPinViewController *vc = (PLPinViewController*)[PLEnterPinWindow defaultInstance].rootViewController;
    if ([vc.pinDelegate respondsToSelector:@selector(pinViewController:didEnterPin:)])
    {
        [vc.pinDelegate pinViewController:self didEnterPin:pinElement.value];
    }
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
    
    PLPinViewController *vc = (PLPinViewController*)[PLEnterPinWindow defaultInstance].rootViewController;
    if ([vc.pinDelegate respondsToSelector:@selector(pinViewControllerDidLogout:)])
    {
        [vc.pinDelegate pinViewControllerDidLogout:self];
    }
}

@end
