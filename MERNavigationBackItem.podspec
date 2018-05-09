
Pod::Spec.new do |s|
  s.name             = 'MERNavigationBackItem'
  s.version          = '0.1.0'
  s.summary          = 'MERNavigationBackItem'


  s.description      = '全局替换系统导航栏左上角默认返回按钮样式，导入文件即可生效'

  s.homepage         = 'https://github.com/Mervin1024/MERNavigationBackItem'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '马遥' => 'mervin1024@163.com' }
  s.source           = { :git => 'https://github.com/Mervin1024/MERNavigationBackItem.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MERNavigationBackItem/Classes/**/*'
  s.public_header_files = 'MERNavigationBackItem/Classes/*.h'


end
