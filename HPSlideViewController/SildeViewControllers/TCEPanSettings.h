//
//  TCEPanSettings.h
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TCEPanSettings : NSObject

+ (instancetype)defaultSettings;

@property (nonatomic, assign) float maxScaleRatio;
@property (nonatomic, assign) float maxTranslateRatio;

@end
