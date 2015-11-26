//
//  TCESlideViewController.m
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import "TCEMenuViewController.h"
#import "TCEPanSettings.h"

@interface TCEMenuViewController ()
{
    UIView *_maskView;
    float _currentProgress;
}
@end

@implementation TCEMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
    [super willMoveToParentViewController:parent];
}

#pragma mark - TCEPanProtocol

- (void)panWithProgress:(float)progress
{
    if (!_maskView) {
        _maskView = [[UIView alloc] initWithFrame:self.parentViewController.view.bounds];
        _maskView.backgroundColor = [UIColor blackColor];
        _maskView.alpha = 0.6;
        [self.parentViewController.view insertSubview:_maskView aboveSubview:self.view];
    }
    
    progress = MIN(progress, 1.0);
    progress = MAX(progress, 0.0);
    
    float _progress = 1 - progress;
    
    float translationRatio = 1 - [TCEPanSettings defaultSettings].maxTranslateRatio;
    float scaleRatio = 1 - [TCEPanSettings defaultSettings].maxScaleRatio;
    
    float w = CGRectGetWidth(self.parentViewController.view.bounds);
    CGAffineTransform t = CGAffineTransformMakeTranslation(-translationRatio * w * _progress , 0);
    CGAffineTransform s = CGAffineTransformMakeScale(1 - scaleRatio * _progress, 1 - scaleRatio *_progress);
    self.view.transform = CGAffineTransformConcat(t, s);
    
    _maskView.alpha = 0.6 * (1 - progress);
    
    _currentProgress = progress;
}

- (void)endPanWithProgress:(float)progress completionBlock:(void (^)(BOOL))block
{
    progress = progress >= 0.5 ? 1.0 : 0.0;
    
    // if this animation is triggered by a tap gestrue,
    // we need to set up a intialized interface to
    // make this animation smooth.
    if (!_maskView) {
        [self panWithProgress:_currentProgress];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        [self panWithProgress:progress];
    } completion:^(BOOL finished) {
        
        _currentProgress = progress;
        
        [_maskView removeFromSuperview];
        _maskView = nil;
        
        if (block) {
            block(progress > 0);
        }
    }];
}

@end
