Pod::Spec.new do |spec|
    spec.name         = 'CSafariWebKit'
    spec.version      = '0.1.2'
    spec.ios.deployment_target  = '11.0'
    spec.license      = { :type => 'BSD' }
    spec.homepage     = 'https://github.com/dmandarino/CSafariWebKit'
    spec.authors      = { 'Douglas Mandarino' => 'douglas.mandarino@gmail.com' }
    spec.summary      = 'A framework that helps the usage of SFSafariViewController.'
    spec.source       = { :git => 'https://github.com/dmandarino/CSafariWebKit.git', :tag => '0.1.1'}
    spec.source_files = 'CSafariWebKit/**/*.{swift}'
    spec.framework    = 'UIKit'
end
