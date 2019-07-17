//
//  SwiftKnife
//
//  Copyright © 2019 TheInkedEngineer. All rights reserved.
//

import UIKit

public extension UIDevice {

  /// Enum that represents an iOS platform
  enum PlatformName: String {

    /// the platform is notAvailable
    case notAvailable = "notAvailable"

    /// the platform is an iPhone2G.
    case iPhone2G = "iPhone2G"

    /// the platform is an iPhone3G.
    case iPhone3G = "iPhone3G"

    /// the platform is an iPhone3GS.
    case iPhone3GS = "iPhone3GS"

    /// the platform is an iPhone4.
    case iPhone4 = "iPhone4"

    /// the platform is an iPhone4S.
    case iPhone4S = "iPhone4S"

    /// the platform is an iPhone5.
    case iPhone5 = "iPhone5"

    /// the platform is an iPhone5C.
    case iPhone5C = "iPhone5C"

    /// the platform is an iPhone5S.
    case iPhone5S = "iPhone5S"

    /// the platform is an iPhoneSE.
    case iPhoneSE = "iPhoneSE"

    /// the platform is an iPhone6.
    case iPhone6 = "iPhone6"

    /// the platform is an iPhone6Plus.
    case iPhone6Plus = "iPhone6Plus"

    /// the platform is an iPhone6S.
    case iPhone6S = "iPhone6S"

    /// the platform is an iPhone6SPlu.
    case iPhone6SPlus = "iPhone6SPlus"

    /// the platform is an iPhone7.
    case iPhone7 = "iPhone7"

    /// the platform is an iPhone7Plus.
    case iPhone7Plus = "iPhone7Plus"

    /// the platform is an iPhone8.
    case iPhone8 = "iPhone8"

    /// the platform is an iPhone8Plus.
    case iPhone8Plus = "iPhone8Plus"

    /// the platform is an iPhoneX.
    case iPhoneX = "iPhoneX"

    /// the platform is an iPhoneXS.
    case iPhoneXS = "iPhoneXS"

    /// the platform is an iPhoneXSMax.
    case iPhoneXSMax = "iPhoneXSMax"

    /// the platform is an iPhoneXR.
    case iPhoneXR = "iPhoneXR"

    /// the platform is an iPodTouch1G.
    case iPodTouch1G = "iPodTouch1G"

    /// the platform is an iPodTouch2G.
    case iPodTouch2G = "iPodTouch2G"

    /// the platform is an iPodTouch3G.
    case iPodTouch3G = "iPodTouch3G"

    /// the platform is an iPodTouch4G.
    case iPodTouch4G = "iPodTouch4G"

    /// the platform is an iPodTouch5G.
    case iPodTouch5G = "iPodTouch5G"

    /// the platform is an iPodTouch6G.
    case iPodTouch6G = "iPodTouch6G"

    /// the platform is an iPodTouch6G.
    case iPodTouch7G = "iPodTouch7G"

    /// the platform is an iPad.
    case iPad = "iPad"

    /// the platform is an iPad2.
    case iPad2 = "iPad2"

    /// the platform is an iPad3.
    case iPad3 = "iPad3"

    /// the platform is an iPad4.
    case iPad4 = "iPad4"

    /// the platform is an iPadMini.
    case iPadMini = "iPadMini"

    /// the platform is an iPadMini2.
    case iPadMini2 = "iPadMini2"

    /// the platform is an iPadMini3.
    case iPadMini3 = "iPadMini3"

    /// the platform is an iPadMini4.
    case iPadMini4 = "iPadMini4"

    /// the platform is an iPadMini5.
    case iPadMini5 = "iPadMini5"

    /// the platform is an iPadAir.
    case iPadAir = "iPadAir"

    /// the platform is an iPadAir2.
    case iPadAir2 = "iPadAir2"

    /// the platform is an iPadAir3.
    case iPadAir3 = "iPadAir3"

    /// the platform is an iPadPro9Inch.
    case iPadPro9Inch = "iPadPro9Inch"

    /// the platform is an iPadPro10Inch.
    case iPadPro10Inch = "iPadPro10Inch"

    /// the platform is an iPadPro11Inch.
    case iPadPro11Inch = "iPadPro11Inch"

    /// the platform is an iPadPro12Inch.
    case iPadPro12Inch = "iPadPro12Inch"

    /// the platform is an iPadPro12Inch2.
    case iPadPro12Inch2 = "iPadPro12Inch2"

    /// the platform is an iPadPro12Inch3.
    case iPadPro12Inch3 = "iPadPro12Inch3"

    /// the platform is an simulator.
    case simulator = "simulator"
  }

  /// The current raw platform of the device/simulator
  var platform: String {
    var systemInfo = utsname()
    uname(&systemInfo)

    let machine = systemInfo.machine
    let mirror = Mirror(reflecting: machine)

    // The identifiers  of the platform
    var identifier = ""

    mirror.children.forEach { child in
      if let value = child.value as? Int8, value != 0 {
        identifier.append(String(UnicodeScalar(UInt8(value))))
      }
    }

    return identifier
  }

  // codebeat:disable[LOC]

  /// The current platform of the device/simulator
  var platformName: PlatformName {
    let platform = self.platform

    switch platform {
    case "i386":
      return .simulator

    case "x86_64":
      return .simulator

    case "iPhone1,1":
      return .iPhone2G

    case "iPhone1,2":
      return .iPhone3G

    case "iPhone2,1":
      return .iPhone3GS

    case "iPhone3,1", "iPhone3,2", "iPhone3,3":
      return .iPhone4

    case "iPhone4,1":
      return .iPhone4S

    case "iPhone5,1", "iPhone5,2":
      return .iPhone5

    case "iPhone5,3", "iPhone5,4":
      return .iPhone5C

    case "iPhone6,1", "iPhone6,2":
      return .iPhone5S

    case "iPhone7,1":
      return .iPhone6Plus

    case "iPhone7,2":
      return .iPhone6

    case "iPhone8,2":
      return .iPhone6SPlus

    case "iPhone8,1":
      return .iPhone6S

    case "iPhone8,4":
      return .iPhoneSE

    case "iPhone9,1", "iPhone9,3":
      return .iPhone7

    case "iPhone9,2", "iPhone9,4":
      return .iPhone7Plus

    case "iPhone10,1", "iPhone10,4":
      return .iPhone8

    case "iPhone10,2", "iPhone10,5":
      return .iPhone8Plus

    case "iPhone10,3", "iPhone10,6":
      return .iPhoneX

    case "iPhone11,2":
      return .iPhoneXS

    case "iPhone11,4", "iPhone11,6":
      return .iPhoneXSMax

    case "iPhone11,8":
      return .iPhoneXR

    case "iPod1,1":
      return .iPodTouch1G

    case "iPod2,1":
      return .iPodTouch2G

    case "iPod3,1":
      return .iPodTouch3G

    case "iPod4,1":
      return .iPodTouch4G

    case "iPod5,1":
      return .iPodTouch5G

    case "iPod7,1":
      return .iPodTouch6G

    case "iPod9,1":
      return .iPodTouch7G

    case "iPad2,5", "iPad2,6", "iPad2,7":
      return .iPadMini

    case "iPad4,4", "iPad4,5", "iPad4,6":
      return .iPadMini2

    case "iPad4,7", "iPad4,8":
      return .iPadMini3

    case "iPad5,1", "iPad5,2":
      return .iPadMini4

    case "iPad11,1", "iPad11,2":
      return .iPadMini5

    case "iPad1,1", "iPad1,2":
      return .iPad

    case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
      return .iPad2

    case "iPad3,1", "iPad3,2", "iPad3,3":
      return .iPad3

    case "iPad3,4", "iPad3,5", "iPad3,6":
      return .iPad4

    case "iPad4,1", "iPad4,2", "iPad4,3":
      return .iPadAir

    case "iPad5,3", "iPad5,4":
      return .iPadAir2

    case "iPad11,3", "iPad11,4":
      return .iPadAir3

    case "iPad6,3", "iPad6,4":
      return .iPadPro9Inch

    case "iPad7,3", "iPad7,4":
      return .iPadPro10Inch

    case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":
      return .iPadPro11Inch

    case "iPad6,7", "iPad6,8":
      return .iPadPro12Inch

    case "iPad7,1", "iPad7,2":
      return .iPadPro12Inch2

    case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":
      return .iPadPro12Inch3

    default:
      return .notAvailable
    }
  }

  // codebeat:enable[LOC]
}
