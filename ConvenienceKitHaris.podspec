#
# Be sure to run `pod lib lint ConvenienceKitHaris.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ConvenienceKitHaris'
  s.version          = '0.1.6'
  s.summary          = '便捷工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/haijun-suyan/ConvenienceKitHaris'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'haijun-suyan' => '15261882407@163.com' }
  s.source           = { :git => 'https://github.com/haijun-suyan/ConvenienceKitHaris.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.platform = :ios, '10.0'

  s.static_framework = true

  s.source_files = 'ConvenienceKitHaris/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ConvenienceKitHaris' => ['ConvenienceKitHaris/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Masonry', '~> 1.1.0'
  s.dependency 'PLCrashReporter', '~> 1.11.1'
end
