platform :ios, '9.0'

workspace 'SteamKit'
project 'SteamKit.xcodeproj'
project 'SteamKitExample.xcodeproj'

target 'SteamKit' do
  pod 'RMMapper'
  pod 'AFNetworking'
  project 'SteamKit.xcodeproj'
end

target 'SteamKitExample' do
    pod 'SteamKit', :path => 'SteamKit.podspec'
    project 'SteamKitExample.xcodeproj'
end
