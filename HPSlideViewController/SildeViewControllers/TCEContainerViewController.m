//
//  TCEContainerViewController.m
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import "TCEContainerViewController.h"
#import "TCEMenuViewController.h"
#import "TCEMainViewController.h"
#import "TCEPanSettings.h"

@interface TCEContainerViewController ()
{
    UIScreenEdgePanGestureRecognizer *_edgePan;
    float _maxTranslation;
}
@end

@implementation TCEContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1. set up plugin's features
    
    [self initChildViewControllers];
    
    _edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleEdgePan:)];
    _edgePan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:_edgePan];
    
    _maxTranslation = [TCEPanSettings defaultSettings].maxTranslateRatio * CGRectGetWidth([UIScreen mainScreen].bounds);
    
}

- (void)handleEdgePan:(UIPanGestureRecognizer *)sender
{
    CGPoint point = [sender translationInView:self.view];
    float progress = point.x/_maxTranslation;
    [self changeState:sender.state withProgress:progress];
}

- (void)changeState:(UIGestureRecognizerState)state withProgress:(float)progress
{
    if (state == UIGestureRecognizerStateChanged || state == UIGestureRecognizerStateBegan) {
        [_menuViewController panWithProgress:progress];
        [_mainViewController panWithProgress:progress];
        
    } else {
        [_menuViewController endPanWithProgress:progress completionBlock:^(BOOL flag) {
            _edgePan.enabled = !flag;
        }];
        [_mainViewController endPanWithProgress:progress completionBlock:^(BOOL flag) {
            _edgePan.enabled = !flag;
        }];
    }
}

- (void)initChildViewControllers
{
    // to be implemented...
}
@end
