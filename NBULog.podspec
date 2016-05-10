

Pod::Spec.new do |s|
    
    s.name          = "NBULog"
    s.version       = "1.3.0"
    s.summary       = "Log framework based on CocoaLumberjack. Adds dynamic log levels, modules' support and eases usage."
    s.homepage      = "http://cyberagent.github.io/NBULog/"
    
    s.license       = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
    s.author        = { "CyberAgent Inc." => "", "Ernesto Rivera" => "rivera_ernesto@cyberagent.co.jp" }
    s.screenshots   = [ "http://cyberagent.github.io/NBULog/images/xcodecolors.png",
                        "http://ptez.github.io/LumberjackConsole/images/screenshot2.png",
                        "http://ptez.github.io/LumberjackConsole/images/screenshot3.png" ]
    s.source        = { :git => "https://github.com/CyberAgent/NBULog.git", :tag => "#{s.version}" }
    
    s.ios.deployment_target = '5.0'
    s.osx.deployment_target = '10.7'
    s.requires_arc  = true
    s.source_files  = 'Source/*.{h,m}'
    s.preserve_paths = "README.md", "NOTICE"
    
    s.dependency 'CocoaLumberjack', '>= 2.3.0'

end

