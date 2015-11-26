//
//  TCEPanProtocol.h
//  SAPEmailDemo
//
//  Created by Hu, Peng on 11/25/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TCEPanProtocol <NSObject>

@required
- (void)panWithProgress:(float)progress;
- (void)endPanWithProgress:(float)progress completionBlock:(void (^)(BOOL flag))block;

@end
