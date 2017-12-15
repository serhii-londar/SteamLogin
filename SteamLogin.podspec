Pod::Spec.new do |spec|
  spec.name         = 'SteamLogin'
  spec.author       = 'Serhii Londar'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/serhii-londar/SteamLogin.git'
  spec.version      = '0.1.1'
  spec.summary      = 'Steam library for login user and retreive steam user id.'
  spec.source       = { :git => 'https://github.com/serhii-londar/SteamLogin.git', :tag => spec.version }
  spec.ios.deployment_target = '9.0'
  spec.social_media_url = 'https://twitter.com/serhii_londar'
  spec.default_subspec = 'Login'
  spec.description      = <<-DESC
  'Steam library for login user and retreive steam user id. Written in pure swift and support iOS 9 and more.'
                       DESC
  spec.screenshots     = 'https://i.imgur.com/euv7Hht.png', 'https://i.imgur.com/m4c1Yoc.png', 'https://i.imgur.com/sgtTc8w.png'
  spec.pod_target_xcconfig = { "SWIFT_VERSION" => "4.0" }
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.subspec 'Login' do |sp|
    sp.source_files = 'SteamLogin/Source/**/*.swift'
    sp.resources = 'SteamLogin/Source/SteamLoginVC/*.xib'
  end
end
