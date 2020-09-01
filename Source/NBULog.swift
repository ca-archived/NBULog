//
//  NBULog.swift
//  NBULog
//
//  Created by Ernesto Rivera on 11/28/18.
//  Copyright (c) 2012-2017 CyberAgent Inc.
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

import Foundation

func LogMaybe(_ message: @autoclosure () -> String, asynchronous: Bool = true, level: DDLogLevel = NBULog.appLogLevel(), flag: DDLogFlag, context: Int = 0, tag: Any? = nil)
{
    if level.rawValue & flag.rawValue != 0
    {
        let logMessage = DDLogMessage(message: message(), level: level, flag: flag, context: context, file: String(describing: #file), function: String(describing: #function), line: #line, tag: tag, options: [.copyFile, .copyFunction], timestamp: nil)
        DDLog.sharedInstance.log(asynchronous: asynchronous, message: logMessage)
    }
}

public func NBULogError(_ message: @autoclosure () -> String)
{
    LogMaybe(message, flag: .error)
}

public func NBULogWarn(_ message: @autoclosure () -> String)
{
    LogMaybe(message, flag: .warning)
}

public func NBULogInfo(_ message: @autoclosure () -> String)
{
    LogMaybe(message, flag: .info)
}

public func NBULogDebug(_ message: @autoclosure () -> String)
{
    LogMaybe(message, flag: .debug)
}

public func NBULogVerbose(_ message: @autoclosure () -> String)
{
    LogMaybe(message, flag: .verbose)
}

