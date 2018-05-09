Pod::Spec.new do |spec|
    spec.name         = 'CSafariWebKit'
    spec.version      = '0.1.3.1'
    spec.ios.deployment_target  = '11.0'
    spec.license      = { :type => 'BSD' }
    spec.homepage     = 'https://github.com/dmandarino/CSafariWebKit'
    spec.authors      = { 'Douglas Mandarino' => 'douglas.mandarino@gmail.com' }
    spec.summary      = 'A framework that helps the usage of SFSafariViewController.'
    spec.source       = { :git => 'https://github.com/dmandarino/CSafariWebKit.git' }
    spec.source_files = 'CSafariWebKit/SafariViewController/*.{swift}'
    spec.framework    = 'UIKit'
end
