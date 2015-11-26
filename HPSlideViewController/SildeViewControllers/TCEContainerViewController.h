//
//  TCEContainerViewController.h
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCEMainViewController, TCEMenuViewController;

@interface TCEContainerViewController : UIViewController

@property (nonatomic, strong) TCEMainViewController *mainViewController;
@property (nonatomic, strong) TCEMenuViewController *menuViewController;

- (void)changeState:(UIGestureRecognizerState)state withProgress:(float)progress;

- (void)initChildViewControllers;

@end
