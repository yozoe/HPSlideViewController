//
//  NSString+TCEExt.m
//  EmailDemoOC
//
//  Created by Hu, Peng on 11/5/15.
//  Copyright © 2015 Hu, Peng. All rights reserved.
//

#import "NSString+TCEExt.h"

@implementation NSString (TCEExt)

@end

@implementation NSString (URLHelper)

- (NSDictionary *)params
{
    NSString *queryStr = [self substringFromIndex:[self rangeOfString:@"?"].location];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    for (NSString *paramStr in [queryStr componentsSeparatedByString:@"&"]) {
        NSArray *paramInfo = [paramStr componentsSeparatedByString:@"="];
        if (paramInfo.count < 2) {
            continue;
        }
        [params setObject:paramInfo[1] forKey:paramInfo[0]];
    }
    
    return [params copy];
}

@end
