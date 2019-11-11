Pod::Spec.new do |spec|
    spec.name                   = 'CSafariWebKit'
    spec.version                = '1.0.3'
    spec.ios.deployment_target  = '11.0'
    spec.license                = { :type => 'MIT' }
    spec.homepage               = 'https://github.com/dmandarino/CSafariWebKit'
    spec.authors                = { 'Douglas Mandarino' => 'douglas.mandarino@gmail.com' }
    spec.summary                = 'A framework that helps the usage of WebView for both WKWebView and SFSafariViewController.'
    spec.source                 = { :git => 'https://github.com/dmandarino/CSafariWebKit.git', :tag => '1.0.3' }
    spec.source_files           = 'CSafariWebKit/Classes/**/*.{swift}'
    spec.ios.framework          = 'UIKit'
    spec.swift_version          = '5.0'
end
