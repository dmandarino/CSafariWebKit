#
#  Be sure to run `pod spec lint CSafariWebKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.platform = :ios, '9.0'
  s.ios.deployment_target = '11.0'
  s.name         = "CSafariWebKit"
  s.summary      = "A framework that helps the usage of SFSafariViewController."
  s.requires_arc = true
  s.version = "0.1.0"
  s.license = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author  = { "dmandarino" => "douglas.mandarino@gmail.com" }
  s.homepage = "https://github.com/dmandarino/CSafariWebKit"
  s.source = { :git => "https://github.com/dmandarino/CSafariWebKit.git", :tag => "0.1.0"}
#s.framework = "UIKit"
  s.source_files = "CSafariWebKit/**/*.{swift}"
  s.description  = <<-DESC
    POD to use a customized SafariViewController that removes the need of implementing SFSafariViewControllerDelegates and Configuration.
  DESC
  s.homepage     = "https://github.com/dmandarino/CSafariWebKit"

end
