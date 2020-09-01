

Pod::Spec.new do |s|
    
    s.name          = "NBULog"
    s.version       = "2.5.1"
    s.summary       = "Log framework based on CocoaLumberjack. Adds dynamic log levels, modules' support and eases usage."
    s.homepage      = "http://cyberagent.github.io/NBULog/"
    
    s.license       = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
    s.author        = { "CyberAgent Inc." => "", "Ernesto Rivera" => "rivera_ernesto@cyberagent.co.jp" }
    s.screenshots   = [ "http://cyberagent.github.io/NBULog/images/xcodecolors.png",
                        "http://ptez.github.io/LumberjackConsole/images/screenshot2.png",
                        "http://ptez.github.io/LumberjackConsole/images/screenshot3.png" ]
    s.source        = { :git => "https://github.com/CyberAgent/NBULog.git", :tag => "#{s.version}" }
    
    s.ios.deployment_target = '8.0'
    s.osx.deployment_target = '10.9'
    s.swift_version = '4.2'
    s.requires_arc  = true
    s.preserve_paths = "README.md", "NOTICE"
    
    s.default_subspec = 'Base'
    s.dependency 'CocoaLumberjack', '>= 3.x'

    s.subspec 'Base' do |sub|
        sub.source_files  = 'Source/*.{h,m,swift}'
    end

    s.subspec 'Console' do |sub|
        sub.platform = :ios
        sub.dependency 'NBULog/Base'
        sub.dependency 'LumberjackConsole', '>= 3.x'
    end
    
end

