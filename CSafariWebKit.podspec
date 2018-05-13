Pod::Spec.new do |spec|
    spec.name         = 'CSafariWebKit'
    spec.version      = '0.1.6'
    spec.ios.deployment_target  = '9.0'
    spec.license      = { :type => 'MIT' }
    spec.homepage     = 'https://github.com/dmandarino/CSafariWebKit'
    spec.authors      = { 'Douglas Mandarino' => 'douglas.mandarino@gmail.com' }
    spec.summary      = 'A framework that helps the usage of SFSafariViewController.'
    spec.source       = { :git => 'https://github.com/dmandarino/CSafariWebKit.git' }
    spec.source_files = 'CSafariWebKit/SafariViewController/*.{swift}'
end
