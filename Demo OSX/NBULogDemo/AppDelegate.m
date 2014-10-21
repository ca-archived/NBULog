//
//  AppDelegate.m
//  NBULogDemo
//
//  Created by 利辺羅 on 2014/09/18.
//  Copyright (c) 2014年 CyberAgent Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "MockNetworkModule.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Set log level for a specific module
    [NBULog setAppLogLevel:LOG_LEVEL_INFO
                 forModule:APP_MODULE_NETWORK];
    
    // Test logs from C functions
    testCLogs();
    
    // Test log modules
    [MockNetworkModule generateMockMessages];
}

- (IBAction)buttonClicked:(NSButton *)sender
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

#pragma mark - Logs from C functions

void testCLogs()
{
    NBULogTrace();
    NBULogVerbose(@"Verbose message from a C function");
    NBULogInfo(@"Info message from a C function");
    NBULogWarn(@"Warning message from a C function");
    NBULogError(@"Error message from a C function");
}

@end

