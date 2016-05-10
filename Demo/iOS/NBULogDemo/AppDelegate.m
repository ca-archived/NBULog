//
//  AppDelegate.m
//  NBULogDemo
//
//  Created by Ernesto Rivera on 2013/11/13.
//  Copyright (c) 2012-2016 CyberAgent Inc.
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

#import "AppDelegate.h"
#import "MockNetworkModule.h"

void testCLogs();

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifndef MY_PRODUCTION_MACRO
    // Register custom modules
    [NBULog registerAppContextWithModulesAndNames:@{@(APP_MODULE_NETWORK)   : @"Network",
                                                    @(APP_MODULE_OTHER)     : @"Other"}];
    
    // Add dashboard only for testing builds
    [NBULog addDashboardLogger];
#endif
    
    // Set log level for a specific module
    [NBULog setAppLogLevel:DDLogLevelInfo
                 forModule:APP_MODULE_NETWORK];
    
    // Test logs from C functions
    testCLogs();
    
    // Test log modules
    [MockNetworkModule generateMockMessages];
    
    return YES;
}

- (IBAction)buttonTapped:(UIButton *)sender
{
    switch (sender.tag)
    {
        case 0:
            NBULogTrace();
            break;
        case 1:
            NBULogVerbose(@"Test message");
            break;
        case 2:
            NBULogDebug(@"Test message");
            break;
        case 3:
            NBULogInfo(@"Test message");
            break;
        case 4:
            NBULogWarn(@"Test message");
            break;
        default:
            NBULogError(@"Test message");
            break;
    }
}

@end


#pragma mark - Logs from C functions

void testCLogs()
{
    NBULogTrace();
    NBULogVerbose(@"Verbose message from a C function");
    NBULogInfo(@"Info message from a C function");
    NBULogWarn(@"Warning message from a C function");
    NBULogError(@"Error message from a C function");
}

