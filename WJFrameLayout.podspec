#
# Be sure to run `pod lib lint WJFrameLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WJFrameLayout'
  s.version          = '0.1.0'
  s.summary          = 'An iOS layout framework based on Frame layout. The way using it is like Masonry'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An iOS layout framework based on Frame layout. The way using it is like Masonry
                       DESC

  s.homepage         = 'https://github.com/wangwanjie/WJFrameLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangwanjie' => 'wangwanjie1993@gmail.com' }
  s.source           = { :git => 'https://github.com/wangwanjie/WJFrameLayout.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '6.0'

  s.source_files = 'WJFrameLayout/Classes/**/*.{h,m}'
  
  # s.resource_bundles = {
  #   'WJFrameLayout' => ['WJFrameLayout/Assets/*.png']
  # }

  s.public_header_files = 'WJFrameLayout/Classes/WJFrameLayout.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.requires_arc = true
end
