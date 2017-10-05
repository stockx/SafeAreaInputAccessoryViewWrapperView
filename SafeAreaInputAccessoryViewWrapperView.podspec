Pod::Spec.new do |s|
  s.name             = 'SafeAreaInputAccessoryViewWrapperView'
  s.version          = '1.0.0'
  s.screenshot       = ''
  s.summary          = 'SafeAreaInputAccessoryViewWrapperView provides a way to wrap custom inputAccessoryView views to respect bottom safe area layouts.'
  s.homepage         = 'https://github.com/StockX/SafeAreaInputAccessoryViewWrapperView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jeff Burt' => 'jburt1992@gmail.com' }
  s.source           = { :git => 'https://github.com/StockX/SafeAreaInputAccessoryViewWrapperView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jeffburtjr'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SafeAreaInputAccessoryViewWrapperView/Classes/**/*'
end
