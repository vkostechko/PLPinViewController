//
//  PLCreatePinViewController.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLCreatePinViewController.h"
#import "PLFormPinField.h"
#import "PLSlideTransition.h"

@import PLForm;

@interface PLCreatePinViewController () <PLFormElementDelegate, UINavigationControllerDelegate>
{
    PLFormPinFieldElement *pinElement;
}

@property (weak, nonatomic) IBOutlet PLFormPinField *pinField;
@property (weak, nonatomic) IBOutlet UIImageView *illustration;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@end


@implementation PLCreatePinViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // lets hook up the element
    pinElement = [PLFormPinFieldElement pinFieldElementWithID:0 pinLength:4 delegate:self];
    pinElement.dotSize = 10;
    [self.pinField updateWithElement:pinElement];
    
    [self.pinField becomeFirstResponder];
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    self.illustration.hidden = (result.height == 480);
    self.errorLabel.alpha = 0;
    
    self.navigationController.delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    PLSlideTransition *transition = [PLSlideTransition new];
    transition.operation = operation;
    return transition;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vc = [segue destinationViewController];
    // set the view controllers user info (same as the ours)
    SEL sel = NSSelectorFromString(@"pin");
    if ([vc respondsToSelector:sel])
    {
        [vc setValue:pinElement.value forKey:@"pin"];
    }
}


- (void)formElementDidChangeValue:(PLFormElement *)formElement;
{
    // we now need to advance to the next one
    [self performSegueWithIdentifier:@"advance" sender:nil];
}

- (IBAction)unwindToCreatPin:(UIStoryboardSegue *)unwindSegue
{
    // we need to clear the entered pin
    pinElement.value = nil;
    self.errorLabel.alpha = 1;
    [self.pinField updateWithElement:pinElement];
    [self.pinField becomeFirstResponder];
}

@end
