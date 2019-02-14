Pod::Spec.new do |s|
  s.name             = 'SafeAreaInputAccessoryViewWrapperView'
  s.version          = '1.0.1'
  s.screenshot       = 'https://user-images.githubusercontent.com/2835199/31238567-5c96c3f2-a9c8-11e7-86f5-170ebc372cdc.png'
  s.summary          = 'SafeAreaInputAccessoryViewWrapperView provides a way to wrap custom inputAccessoryView views to respect bottom safe area layouts.'
  s.description      = <<-DESC
SafeAreaInputAccessoryViewWrapperView is useful for wrapping a view to be used as an inputAccessoryView. Without this, setting the view as an inputAccessoryView will ignore safe area layouts. For example, the Home screen indicator on iPhone X will battle for the same spot. This class ensures that the view respects safe area layouts and does not cover up system UI elements such as the Home screen indicator on iPhone X.
                       DESC
  s.homepage         = 'https://github.com/StockX/SafeAreaInputAccessoryViewWrapperView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jeff Burt' => 'jburt1992@gmail.com' }
  s.source           = { :git => 'https://github.com/StockX/SafeAreaInputAccessoryViewWrapperView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jeffburtjr'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SafeAreaInputAccessoryViewWrapperView/Classes/**/*'
end
