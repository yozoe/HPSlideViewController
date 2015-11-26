//
//  TCEMainViewController.m
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import "TCEMainViewController.h"
#import "TCEContainerViewController.h"
#import "TCEPanSettings.h"

@interface TCEMainViewController ()
{
    UIPanGestureRecognizer *_panGesture;
    UITapGestureRecognizer *_tapGesture;
    UIView *_maskView;
    float _maxTranslation;
}

@end

@implementation TCEMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _maxTranslation = [TCEPanSettings defaultSettings].maxTranslateRatio * CGRectGetWidth([UIScreen mainScreen].bounds);
}

- (IBAction)presentMeun:(id)sender
{
    TCEContainerViewController *parentViewController = (TCEContainerViewController *)self.parentViewController;
    [parentViewController changeState:UIGestureRecognizerStateEnded withProgress:1.0];
}

#pragma mark - gesture handlers

- (void)handlePan:(UIPanGestureRecognizer *)sender
{
    CGPoint point = [sender translationInView:_maskView];
    float progress = -point.x/_maxTranslation;
    
    TCEContainerViewController *parentViewController = (TCEContainerViewController *)self.parentViewController;
    [parentViewController changeState:sender.state withProgress:1 - progress];
}


- (void)handleTap:(UITapGestureRecognizer *)sender
{
    TCEContainerViewController *parentViewController = (TCEContainerViewController *)self.parentViewController;
    [parentViewController changeState:sender.state withProgress:0.0];
}


#pragma mark - TCEPanProtocol

- (void)panWithProgress:(float)progress
{
    progress = MIN(progress, 1.0);
    progress = MAX(progress, 0.0);
    
    float translationRatio = [TCEPanSettings defaultSettings].maxTranslateRatio;
    float scaleRatio = 1 - [TCEPanSettings defaultSettings].maxScaleRatio;
    
    float w = CGRectGetWidth(self.parentViewController.view.bounds);
    CGAffineTransform t = CGAffineTransformMakeTranslation(translationRatio * w * progress , 0);
    CGAffineTransform s = CGAffineTransformMakeScale(1 - scaleRatio * progress, 1 - scaleRatio *progress);
    self.view.transform = CGAffineTransformConcat(t, s);
}

- (void)endPanWithProgress:(float)progress completionBlock:(void (^)(BOOL))block
{
    progress = progress >= 0.5 ? 1.0 : 0.0;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self panWithProgress:progress];
    } completion:^(BOOL finished) {
       
        if (progress > 0.0) {
            
            // make sure there is no mask view in subviews
            [_maskView removeFromSuperview];
            
            _maskView = [[UIView alloc] initWithFrame:self.view.bounds];
            _maskView.backgroundColor = [UIColor clearColor];
            [self.view addSubview:_maskView];
            
            _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
            [_maskView addGestureRecognizer:_panGesture];
            _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
            [_maskView addGestureRecognizer:_tapGesture];
        } else {
            [_maskView removeFromSuperview];
            _maskView = nil;
        }
        if (block) {
            block(progress > 0);
        }
    }];
}
@end
