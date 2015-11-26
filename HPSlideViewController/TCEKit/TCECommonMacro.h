//
//  TCECommonMacro.h
//  B1Anywhere
//
//  Created by Hu, Peng on 10/30/15.
//  Copyright © 2015 SAP. All rights reserved.
//

#define SUPPRESS_PERFORM_SELECTOR_LEAK_WARNING(code)                    \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")     \
code                                                                    \
_Pragma("clang diagnostic pop")

#define SUPPRESS_DEPRECATED_WARNING(code)                               \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"")       \
code                                                                    \
_Pragma("clang diagnostic pop")


#define isiPhone ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])