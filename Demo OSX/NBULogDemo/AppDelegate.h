//
//  AppDelegate.h
//  NBULogDemo
//
//  Created by 利辺羅 on 2014/09/18.
//  Copyright (c) 2014年 CyberAgent Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak, nonatomic) IBOutlet NSWindow * window;

- (IBAction)buttonClicked:(NSButton *)sender;

@end

