Pod::Spec.new do |s|
  s.name             = 'WJFrameLayout'
  s.version          = '0.3.0'
  s.summary          = 'An iOS layout framework based on Frame layout. The way using it is like Masonry'
  s.description      = <<-DESC
An iOS layout framework based on Frame layout. The way using it is like Masonry
                        DESC

  s.homepage         = 'https://github.com/wangwanjie/WJFrameLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wangwanjie' => 'wangwanjie1993@gmail.com' }
  s.source           = { :git => 'https://github.com/wangwanjie/WJFrameLayout.git', :tag => s.version.to_s }
  s.ios.deployment_target = '6.0'
  s.source_files = 'WJFrameLayout/**/*.{h,m}'
  s.source_files  = "WJFrameLayout", "WJFrameLayout/**/*.{h,m}"
  s.public_header_files = 'WJFrameLayout/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  s.requires_arc = true
end
