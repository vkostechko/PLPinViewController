//
//  PLViewController.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLExampleViewController.h"

@interface PLExampleViewController ()   

@end

@implementation PLExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createPinPressed:(id)sender {
    [PLPinViewController showControllerWithAction:PLPinViewControllerActionCreate delegate:self animated:YES];
}

- (IBAction)changePinPressed:(id)sender {
    [PLPinViewController showControllerWithAction:PLPinViewControllerActionChange delegate:self animated:YES];
}


- (IBAction)enterPinPressed:(id)sender {
    [PLPinViewController showControllerWithAction:PLPinViewControllerActionEnter delegate:self animated:YES];
}

- (void)pinViewControllerDidCancel:(PLPinViewController *)controller;
{
    
}

- (void)pinViewControllerDidLogout:(PLPinViewController *)controller;
{
    [PLPinViewController dismiss];
}

- (void)pinViewController:(PLPinViewController *)controller didChangePin:(NSString*)pin;
{
    [PLPinViewController dismiss];
    
}

- (BOOL)pinViewController:(PLPinViewController *)controller shouldAcceptPin:(NSString*)pin;
{
    return [pin isEqualToString:@"1111"];
}

- (void)pinViewController:(PLPinViewController *)controller didEnterPin:(NSString*)pin;
{
    [PLPinViewController dismiss];
    
}

- (void)pinViewController:(PLPinViewController *)controller didSetPin:(NSString*)pin;
{
    [PLPinViewController dismiss];
    
}





@end
