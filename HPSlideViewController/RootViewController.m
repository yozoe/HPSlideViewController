//
//  ViewController.m
//  HPSlideViewController
//
//  Created by Hu, Peng on 11/26/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import "RootViewController.h"
#import "UIViewController+TCEExt.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initChildViewControllers
{
    self.menuViewController = (TCEMenuViewController *)[UIViewController loadFromStoryboardWithIdentifier:@"menuViewController"];
    [self smartAddChildViewController:(UIViewController *)self.menuViewController];
    
    self.mainViewController = (TCEMainViewController *)[UIViewController loadFromStoryboardWithIdentifier:@"mainViewController"];
    [self smartAddChildViewController:(UIViewController *)self.mainViewController];
}
@end
