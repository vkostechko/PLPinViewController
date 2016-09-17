//
//  PLViewController.m
//  PLPinViewController
//
//  Created by Ash Thwaites on 09/17/2016.
//  Copyright (c) 2016 Ash Thwaites. All rights reserved.
//

#import "PLExampleViewController.h"

@import PLPinViewController;

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
}

- (IBAction)changePinPressed:(id)sender {
}

- (IBAction)enterPinPressed:(id)sender {
    PLPinViewController *vc = [PLPinViewController pinControllerWithTitle:@"test" action:PLPinViewControllerActionEnter];
    
    [self presentViewController:vc animated:YES completion:nil];
}

@end
