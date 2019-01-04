#
#  Be sure to run `pod spec lint XWCountDownButton_Swift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "XWCountDownButton"
  s.version      = "1.0.4"
  s.summary      = "XWCountDownButton 是一个应用于倒计时的框架！"
  s.swift_version = '4.2'
  s.description  = <<-DESC
XWCountDownButton 是一个应用于倒计时的框架，应用场景很多，比如短信验证码倒计时！
                   DESC

  s.homepage     = "https://github.com/821385843/XWCountDownDemo_Swift"
  s.license      = "MIT"
  s.author             = { "Wade" => "821385843@qq.com" }
  s.ios.deployment_target = '8.0'
  s.source       = { :git => "https://github.com/821385843/XWCountDownDemo_Swift.git", :tag => "#{s.version}" }
  s.source_files = 'Source/*.swift'
  s.ios.frameworks         = 'UIKit', 'Foundation'
  s.requires_arc = true

end
