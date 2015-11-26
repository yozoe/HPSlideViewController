//
//  UIViewController+TCEExt.h
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TCEExt)

@end

@interface UIViewController (StoryboardUtil)

+ (instancetype)loadFromStoryboard;
+ (instancetype)loadFromStoryboardWithIdentifier:(NSString *)identifier;

@end

@interface UIViewController (HierarchyUtil)

- (void)smartAddChildViewController:(UIViewController *)childController;
- (void)smartRemoveChildViewController:(UIViewController *)childController;

@end
