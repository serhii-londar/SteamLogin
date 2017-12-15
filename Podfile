platform :ios, '9.0'

use_frameworks!

workspace 'SteamLogin'
project 'SteamLogin.xcodeproj'
project 'Example.xcodeproj'

target 'SteamLogin' do
  project 'SteamLogin.xcodeproj'
end

target 'Example' do
    pod 'SteamLogin', :path => 'SteamLogin.podspec'
    project 'Example.xcodeproj'
end
