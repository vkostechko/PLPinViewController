//
//  PLPinViewController.m
//  Pods
//
//  Created by Ash Thwaites on 17/09/2016.
//
//

#import "PLPinViewController.h"
#import "PLCreatePinViewController.h"
#import "PLEnterPinViewController.h"

@interface PLPinViewController ()

@end

@implementation PLPinViewController

+ (instancetype)pinControllerWithTitle:(NSString *)title action:(PLPinViewControllerAction)action;
{
    // create the relevant first controller
    UIViewController *topController = nil;
    
    switch (action) {
        case PLPinViewControllerActionCreate:
            topController = [PLCreatePinViewController new];
            break;
        case PLPinViewControllerActionChange:
            topController = [PLCreatePinViewController new];
            break;
        case PLPinViewControllerActionEnter:
            topController = [PLEnterPinViewController new];
            break;
            
        default:
            break;
    }
    
    
    NSBundle *podBundle = [NSBundle bundleForClass:[self class]];
    NSURL *bundleUrl = [podBundle URLForResource:@"PLPinViewController" withExtension:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithURL:bundleUrl];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PLPinViewController" bundle:bundle];
    
    PLPinViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"PLPinViewController"];
    vc.title = title;
    vc.navigationBarHidden = YES;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
