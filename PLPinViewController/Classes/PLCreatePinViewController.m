//
//  PLCreatePinViewController.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLCreatePinViewController.h"
#import "PLFormPinField.h"
#import "PLPinAppearance.h"
#import "PLPinWindow.h"

@import PLForm;

@interface PLCreatePinViewController () <PLFormElementDelegate>
{
    PLFormPinFieldElement *pinElement;
}

@property (weak, nonatomic) IBOutlet PLFormPinField *pinField;
@property (weak, nonatomic) IBOutlet UIImageView *illustration;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end


@implementation PLCreatePinViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // lets hook up the element
    pinElement = [PLFormPinFieldElement pinFieldElementWithID:0 pinLength:4 delegate:self];
    pinElement.dotSize = [PLPinWindow defaultInstance].pinAppearance.pinSize;
    [self.pinField updateWithElement:pinElement];
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    self.illustration.hidden = (result.height == 480);
    self.errorLabel.alpha = 0;
    
    self.pinField.textfield.inputView = [UIView new];
    [self setupAppearance];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.pinField becomeFirstResponder];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.pinField becomeFirstResponder];
}

#pragma mark - Actions

- (IBAction)unwindToCreatPin:(UIStoryboardSegue *)unwindSegue
{
    // we need to clear the entered pin
    pinElement.value = nil;
    self.errorLabel.alpha = 1;
    [self.pinField updateWithElement:pinElement];
    [self.pinField becomeFirstResponder];
}

- (void)formElementDidChangeValue:(PLFormElement *)formElement;
{
    // we now need to advance to the next one
    [self performSegueWithIdentifier:@"advance" sender:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *vc = [segue destinationViewController];
    // set the view controllers user info (same as the ours)
    SEL sel = NSSelectorFromString(@"pin");
    if ([vc respondsToSelector:sel]) {
        [vc setValue:pinElement.value forKey:@"pin"];
    }
}

#pragma mark - Private

- (void)setupAppearance
{
    self.view.backgroundColor = [PLPinWindow defaultInstance].pinAppearance.backgroundColor;
    self.titleLabel.font = [PLPinWindow defaultInstance].pinAppearance.titleFont;
    self.titleLabel.textColor = [PLPinWindow defaultInstance].pinAppearance.titleColor;
    self.messageLabel.font = [PLPinWindow defaultInstance].pinAppearance.messageFont;
    self.messageLabel.textColor = [PLPinWindow defaultInstance].pinAppearance.messageColor;
}

@end
