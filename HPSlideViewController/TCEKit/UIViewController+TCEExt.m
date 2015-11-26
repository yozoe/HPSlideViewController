//
//  UIViewController+TCEExt.m
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import "UIViewController+TCEExt.h"
#import "UIStoryboard+TCEExt.h"

@implementation UIViewController (TCEExt)

@end

@implementation UIViewController (StoryboardUtil)

+ (instancetype)loadFromStoryboard
{
    return [self loadFromStoryboardWithIdentifier:NSStringFromClass([self class])];
}

+ (instancetype)loadFromStoryboardWithIdentifier:(NSString *)identifier
{
    return [[UIStoryboard currentStoryboard] instantiateViewControllerWithIdentifier:identifier];
}
@end

@implementation UIViewController (HierarchyUtil)

- (void)smartAddChildViewController:(UIViewController *)childController
{
    [childController willMoveToParentViewController:self];
    [self.view addSubview:childController.view];
    [self addChildViewController:childController];
    [childController didMoveToParentViewController:self];
}

- (void)smartRemoveChildViewController:(UIViewController *)childController
{
    [childController willMoveToParentViewController:nil];
    [childController.view removeFromSuperview];
    [childController removeFromParentViewController];
}

@end