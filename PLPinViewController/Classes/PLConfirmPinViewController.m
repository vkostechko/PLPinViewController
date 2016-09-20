//
//  PLConfirmPinViewController.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLConfirmPinViewController.h"
#import "PLFormPinField.h"
#import "PLPinViewController.h"
#import "PLEnterPinWindow.h"

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
    if ([pinElement.value isEqualToString:self.pin] )
    {
        PLPinViewController *vc = (PLPinViewController*)[PLEnterPinWindow defaultInstance].rootViewController;
        if ([vc.pinDelegate respondsToSelector:@selector(pinViewController:didSetPin:)])
        {
            [vc.pinDelegate pinViewController:vc didSetPin:pinElement.value];
        }
    }
    else
    {
        [self performSegueWithIdentifier:@"unwindToCreatPin" sender:nil];
    }
}


@end
