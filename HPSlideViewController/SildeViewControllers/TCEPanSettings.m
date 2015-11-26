//
//  TCEPanSettings.m
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import "TCEPanSettings.h"

@implementation TCEPanSettings

+ (instancetype)defaultSettings
{
    static TCEPanSettings *_instance = nil;
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        if (!_instance) {
            _instance = [[TCEPanSettings alloc] init];
        }
    });
    return _instance;
}


- (instancetype)init
{
    if (self = [super init]) {
        _maxScaleRatio = 0.8;
        _maxTranslateRatio = 0.8;
    }
    return self;
}

@end
