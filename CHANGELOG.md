# CHANGELOG

All relative changes will be documented in this file. \
`SwiftKnife` adheres to [Semantic Versioning](https://semver.org).

***
### 3.X Releases

- `3.5.x` Releases - [3.5.0](#350)
- `3.4.x` Releases - [3.4.0](#340)
- `3.3.x` Releases - [3.3.0](#330)
- `3.2.x` Releases - [3.2.0](#320)
- `3.1.x` Releases - [3.1.0](#310)
- `3.0.x` Releases - [3.0.0](#300)

### 2.X Releases

- `2.0.x` Releases - [2.0.0](#200)

### 1.X Releases

**DEPRECATED**

***

## 3.5.0
### December 19, 2019

* add `centerH`,  `centerV` and `center` functions to UIView.
* add `postfix %` custom operator with `func %(lhs: Double)->Double` and `func %(lhs: CGFloat)->CGFloat` 

* fix a bug where opacity was not updated in `SKButton`

## 3.4.0
### October 29, 2019

* add `activateAutoLayout` function to UIView.
* add `activate` and `deactivate` functions to `NSLayoutConstraint`.

## 3.3.0
### October 28, 2019

* add `UIColor` initializer from `CGFloat` array
* add `backgroundHorizontalGradientColor`, `backgroundVerticalGradientColor` and `backgroundGradientColor`

## 3.2.0
### October 22, 2019

* add `Hexadecimal` init to `UIColor` through `init(hex code: String)`
* renamed `opacities` to `opacity` in `SKTextButton`
* added `opacity` to `SKButton`

## 3.1.0
### October 7, 2019

* renamed `PlatformName` to `Device`
* renamed `platformName` to `device`
* renamed `platform` to `hardwareString`

## 3.0.0
### October 6, 2019

* add support for new iOS devices
* add `clear()` functiont to string to set its content to empty string
* add two `UITextField` helper functions: `selectedNSRange` and `setCursonFromStart`
* removed `return` from one line functions

## 2.0.0
### July 18, 2019

* Initial release
