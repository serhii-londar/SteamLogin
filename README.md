# SteamLogin

Steam library for login user and retreive steam user id. Written in pure swift and support iOS 9 and more.

[![CIStatus](http://img.shields.io/travis/serhii-londar/SteamLogin.svg?style=flat)](https://travis-ci.org/serhii-londar/SteamLogin)
[![Version](https://img.shields.io/cocoapods/v/SteamLogin.svg?style=flat)](http://cocoapods.org/pods/SteamLogin)
[![License](https://img.shields.io/cocoapods/l/SteamLogin.svg?style=flat)](http://cocoapods.org/pods/SteamLogin)
[![Platform](https://img.shields.io/cocoapods/p/SteamLogin.svg?style=flat)](http://cocoapods.org/pods/SteamLogin)

## Example

To run the example project, clone the repo, and run `pod install` from the root directory first.

Login proces is simple as:

```swift
SteamLoginVC.login(from: self) { [weak self] (user, error) in
                if let user = user {
                    self?.steamUser = user
                    self?.showSuccessAlert()
                } else {
                    self?.showErrorAlert(error)
                }
            }
```
<p align="center">
  <img src="https://i.imgur.com/euv7Hht.png" width="350"/>
</p>

<p align="center">
  <img src="https://i.imgur.com/m4c1Yoc.png" width="350"/>
</p>

<p align="center">
  <img src="https://i.imgur.com/sgtTc8w.png" width="350"/>
</p>


<!--## Requirements
-->


## Installation

SteamLogin is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SteamLogin'
```

## Author

Github: [Serhii Londar](https://github.com/serhii-londar)

Email: [serhii.londar@gmail.com](mailto:serhii.londar@gmail.com)

## License

SteamLogin is available under the MIT license. See the LICENSE file for more info.
