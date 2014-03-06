//
//  MockNetworkModule.m
//  NBULogDemo
//
//  Created by Ernesto Rivera on 2013/11/14.
//  Copyright (c) 2012-2014 CyberAgent Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "MockNetworkModule.h"

// Define log module for this file
#undef  LOG_MODULE
#define LOG_MODULE APP_MODULE_NETWORK

@implementation MockNetworkModule

+ (void)generateMockMessages
{
    // Random message format
    NSString * format = @"Mock %@ network message";
    
    // Random level
    NSUInteger randomLevel = arc4random() % 5;
    
    // Log
    switch (randomLevel)
    {
        case 4:
            NBULogError(format, @"error");
            break;
        case 3:
            NBULogWarn(format, @"warning");
            break;
        case 2:
            NBULogInfo(format, @"information");
            break;
        case 1:
            NBULogDebug(format, @"debug");
            break;
        default:
            NBULogVerbose(format, @"verbose");
            break;
    }
    
    // Send an extra message for another module
    NBULogInfoWithModule(APP_MODULE_OTHER, @"Log message from a APP_MODULE_OTHER");
    
    // Schedule next message
    double delayInSeconds = (arc4random() % 100) / 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self generateMockMessages];
    });
}

@end

