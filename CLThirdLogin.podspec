#
# Be sure to run `pod lib lint CLThirdLogin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CLThirdLogin'
  s.version          = '0.0.2'
  s.summary          = 'A short description of CLThirdLogin.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Cheneyx/CLThirdLogin'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'CheneyX' => 'i_cheneyx@163.com' }
  s.source           = { :git => 'https://github.com/Cheneyx/CLThirdLogin.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
s.public_header_files = 'CLThirdLogin/Classes/Publish_header.h'
  s.ios.deployment_target = '11.0'

  s.source_files = 'CLThirdLogin/Classes/*'
  
   s.resource_bundles = {
     'CLThirdLogin' => ['CLThirdLogin/Assets/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.swift_version = "4.0"
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.static_framework = true
   s.dependency 'SnapKit'
   s.dependency 'UMShare'
#   s.dependency 'SuperExtension'
end
