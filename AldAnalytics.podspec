Pod::Spec.new do |s|
  # 仓库名称
  s.name         = "AldAnalytics"
  # SDK 版本
  s.version      = "1.0.0"
  # SDK 描述，会显示在 CocoaPods 官网上
  s.summary      = "The official iOS SDK"
  # 官网地址
  s.homepage     = "https://www.aldzs.com/"
  # 源码地址
  s.source       = { :git => 'https://github.com/sensorsdata/sa-sdk-ios.git', :tag => "v#{https://github.com/aldwx/aldSdkIos.git.1.0.0}" }
  # 开源协议，可以不填
  s.license = { :type => "Apache License, Version 2.0" }
  # 开发者信息
  s.author = { "Ald" => "ald" }
  # SDK 支持 iOS 的版本
  s.ios.deployment_target = '11.0'
  # 支持平台
  s.platform = :ios
  s.requires_arc = true
  s.cocoapods_version = '>= 1.5.0'
  s.ios.framework = 'UIKit', 'Foundation'

  s.vendored_frameworks = 'AldAnalytics.xcframework'

end
