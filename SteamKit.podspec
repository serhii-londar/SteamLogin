Pod::Spec.new do |spec|
  spec.name         = 'SteamKit'
  spec.author       = 'Serhii Londar'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/serhii-londar/steamkit.git'
  spec.version      = '0.1'
  spec.summary      = 'Steam library for iOS and OS X'
  spec.source       = { :git => 'https://github.com/serhii-londar/steamkit.git', :tag => spec.version }
  spec.requires_arc = true
  spec.platform     = :ios, "9.0"

  spec.default_subspec = 'Core'

  spec.subspec 'Core' do |sp|
    sp.source_files = 'SteamKit/Source/**/*.{h,m}'
    sp.resources = 'SteamKit/Source/SteamLoginVC/*.xib'
    sp.dependency 'RMMapper'
    sp.dependency 'AFNetworking'
  end

  spec.subspec 'Login' do |sp|
    sp.dependency 'SteamKit/Core'
    sp.source_files = 'SteamKit/{Categories,SteamLoginVC,SteamUser}/*.h,m'
    sp.dependency 'Alamofire', '~> 3.1'
    sp.dependency 'AEXML', '~> 2.0'
  end
end
