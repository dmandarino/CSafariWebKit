Pod::Spec.new do |s|
    s.name                   = 'CSafariWebKit'
    s.version                = '2.0.1'
    s.ios.deployment_target  = '11.0'
    s.license                = { :type => 'MIT' }
    s.homepage               = 'https://github.com/dmandarino/CSafariWebKit'
    s.authors                = { 'Douglas Mandarino' => 'douglas.mandarino@gmail.com' }
    s.summary                = 'A framework that helps the usage of WebView for both WKWebView and SFSafariViewController.'
    s.source                 = { :git => 'https://github.com/dmandarino/CSafariWebKit.git', :tag => s.version.to_s }
    s.swift_version          = '5.2'
    s.source_files           = 'CSafariWebKit/**/*.{swift}'
    s.pod_target_xcconfig     = { 'SWIFT_VERSION' => '5.2' }
end
