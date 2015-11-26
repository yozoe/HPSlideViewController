//
//  UIStoryboard+TCEExt.m
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import "UIStoryboard+TCEExt.h"
#import "TCECommonMacro.h"

@implementation UIStoryboard (TCEExt)

+ (UIStoryboard *)currentStoryboard
{
    NSString *key = isiPhone ? @"UIMainStoryboardFile~iphone" : @"UIMainStoryboardFile~ipad";
    NSString *value = [[NSBundle mainBundle] objectForInfoDictionaryKey:key];
    value = !value ? @"Main" : value;
    return [UIStoryboard storyboardWithName:value bundle:[NSBundle mainBundle]];
}

@end
