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
#import "PLEnterPinWindow.h"
#import "PLSlideTransition.h"

@interface PLPinViewController () <UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (nonatomic,strong) NSString *lastIdentifier;
@property (nonatomic,strong) NSString *initialIdentifier;

@end

@implementation PLPinViewController

+ (void)showControllerWithAction:(PLPinViewControllerAction)action enableCancel:(BOOL)enableCancel delegate:(id<PLPinViewControllerDelegate>)delegate animated:(BOOL)animated
{
    PLPinViewController *vc = (PLPinViewController*)[PLEnterPinWindow defaultInstance].rootViewController;
    vc.pinDelegate = delegate;
    vc.enableCancel = enableCancel;

    switch (action) {
        case PLPinViewControllerActionCreate:
            vc.initialIdentifier = @"showCreatePin";
            break;
        case PLPinViewControllerActionChange:
            vc.initialIdentifier = @"showChangePin";
            break;
        case PLPinViewControllerActionEnter:
            vc.initialIdentifier = @"showEnterPin";
            break;
            
        default:
            break;
    }

    if (vc.initialIdentifier  && [vc isViewLoaded] && vc.view.window)
    {
        [vc performSegueWithIdentifier:vc.initialIdentifier sender:nil];
    }
    [[PLEnterPinWindow defaultInstance] showAnimated:animated];
}

+(void)dismiss
{
    [[PLEnterPinWindow defaultInstance] hideAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.initialIdentifier)
    {
        [self performSegueWithIdentifier:self.initialIdentifier sender:nil];
        return;
    }

    [self performSegueWithIdentifier:@"showEnterPin" sender:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    self.lastIdentifier = [segue.identifier copy];
    self.initialIdentifier = nil;
    
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]])
    {
        ((UINavigationController*)segue.destinationViewController).delegate = self;
    }
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


-(void)presentContainedViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)animated
{
    if (viewControllerToPresent == nil)
    {
        [_currentController willMoveToParentViewController:nil];
        [_currentController.view removeFromSuperview];
        [_currentController removeFromParentViewController];
        _currentController = nil;
        return;
    }
    
    
    [self addChildViewController:viewControllerToPresent];
    [_currentController willMoveToParentViewController:nil];
    
    viewControllerToPresent.view.frame = self.view.bounds;
    viewControllerToPresent.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if (animated)
    {
        viewControllerToPresent.view.alpha = 0.0f;
        
        [self transitionFromViewController:_currentController toViewController:viewControllerToPresent duration:0.3f options:0
                                animations:^
         {
             _currentController.view.alpha = 0.0f;
             viewControllerToPresent.view.transform = CGAffineTransformIdentity;
             viewControllerToPresent.view.alpha = 1.0f;
         }
                                completion:^(BOOL finished)
         {
             [viewControllerToPresent didMoveToParentViewController:self];
             [_currentController removeFromParentViewController];
             _currentController = viewControllerToPresent;
         }];
    }
    else
    {
        [self.view addSubview:viewControllerToPresent.view];
        [self.view bringSubviewToFront:self.cancelButton];
        [_currentController.view removeFromSuperview];
        [_currentController removeFromParentViewController];
        [viewControllerToPresent didMoveToParentViewController:self];
        _currentController = viewControllerToPresent;
    }
}


@end
