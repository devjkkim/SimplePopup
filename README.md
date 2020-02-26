# SimplePopup

[![CI Status](https://img.shields.io/travis/devjkkim/SimplePopup.svg?style=flat)](https://travis-ci.org/devjkkim/SimplePopup)
[![Version](https://img.shields.io/cocoapods/v/SimplePopup.svg?style=flat)](https://cocoapods.org/pods/SimplePopup)
[![License](https://img.shields.io/cocoapods/l/SimplePopup.svg?style=flat)](https://cocoapods.org/pods/SimplePopup)
[![Platform](https://img.shields.io/cocoapods/p/SimplePopup.svg?style=flat)](https://cocoapods.org/pods/SimplePopup)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SimplePopup is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SimplePopup'
```

## Usage

```swift
let v = SimplePopupView(title: "title", message: "message")
let actionCancel = SimpleAction(title: "Cancel") {
  print("Cancel button clicked")
}
v.addAction(actionCancel)
        
let actionOK = SimpleAction(title: "OK", titleColor: .white, btnColor: .black) {
  print("OK button clicked")
}
v.addAction(actionOK)
        
v.show()
```

## Author

Jeongkyun Kim, dev.jkkim@gmail.com

## License

SimplePopup is available under the MIT license. See the LICENSE file for more info.
