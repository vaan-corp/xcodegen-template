//
//  NSColor+Components.swift
//  Color Palette
//
//  Created by Imthath on 17/11/22.
//  Copyright © 2022 SkyDevz. All rights reserved.
//

import AppKit

public extension NSColor {
  // This value can only be changed in internal builds with the ThemePlayground command.
  // It will remain as Default theme for release.
  /// This static property will be moved to a custom type after renaming existing `Theme` to `LegacyTheme`.
  static var currentTheme: RaycastTheme = DefaultTheme()

  static func dynamicColor(_ base: RaycastColor, _ alphaScale: AlphaScale) -> NSColor {
    NSColor(name: base.rawValue + alphaScale.rawValue) { app in
       currentTheme
        .nsColor(for: base)
        .adjusting(lightness: app.raycastAppearance.lightness(for: base), alpha: alphaScale.value)
    }
  }

  static func dynamicColor(name: String, light: NSColor, dark: NSColor) -> NSColor {
    NSColor(name: name) { app in
      switch app.raycastAppearance {
      case .light: return light
      case .dark: return dark
      }
    }
  }
}

extension NSAppearance {
  var raycastAppearance: RaycastAppearance {
    if let result: RaycastAppearance = RaycastAppearance.current {
      return result
    }
    switch bestMatch(from: [.aqua, .darkAqua]) {
    case .some(.darkAqua): return .dark
    default: return .light
    }
  }
}

public enum RaycastColor: String, CaseIterable {
  case background
  case secondaryBackground
  case foreground
  case accent
  case selection
  case loader

  case red
  case orange
  case yellow
  case green
  case blue
  case purple
  case magenta
}

public enum AlphaScale: String, CaseIterable {
  case _100, _200, _300, _400, _500, _600, _700, _800
}

public enum RaycastAppearance: String {
  case light, dark

  public static var current: RaycastAppearance?
}

// MARK: Constant values
extension RaycastTheme {
  func nsColor(for base: RaycastColor) -> NSColor {
    switch base {
    case .background: return background
    case .secondaryBackground: return secondaryBackground
    case .foreground: return foreground
    case .accent: return accent
    case .selection: return selection
    case .loader: return loader
    case .red: return red
    case .orange: return orange
    case .yellow: return yellow
    case .green: return green
    case .blue: return blue
    case .purple: return purple
    case .magenta: return magenta
    }
  }
}

extension AlphaScale {
  var value: CGFloat {
    switch self {
    case ._100: return 1
    case ._200: return 0.8
    case ._300: return 0.6
    case ._400: return 0.4
    case ._500: return 0.2
    case ._600: return 0.15
    case ._700: return 0.1
    case ._800: return 0.05
    }
  }
}

extension RaycastAppearance {
  var isDark: Bool {
    switch self {
    case .light: return false
    case .dark: return true
    }
  }

  func lightness(for color: RaycastColor) -> CGFloat {
    switch color {
    case .background: return isDark ? 15 : 85
    case .secondaryBackground: return isDark ? 15 : 85
    case .foreground: return isDark ? 90 : 5
    case .accent: return isDark ? 64 : 40
    case .selection: return isDark ? 75 : 40
    case .loader: return isDark ? 64 : 40
    case .red: return isDark ? 64 : 40
    case .orange: return isDark ? 64 : 40
    case .yellow: return isDark ? 64 : 40
    case .green: return isDark ? 64 : 40
    case .blue: return isDark ? 64 : 40
    case .purple: return isDark ? 64 : 40
    case .magenta: return isDark ? 64 : 40
    }
  }
}

public extension NSColor {
  /// Provide hex code starting with 0x
  convenience init(rgb: UInt64, alpha: UInt64 = 0xFF) {
    let r = CGFloat((rgb & 0xff0000) >> 16) / 255
    let g = CGFloat((rgb & 0x00ff00) >> 8) / 255
    let b = CGFloat(rgb & 0x0000ff) / 255
    let a = CGFloat(alpha) / 255
    self.init(red: r, green: g, blue: b, alpha: a)
  }
}

// MARK: Helpers
extension NSColor {
  /// Creates a new color adjust lightness and alpha values while keeping the same hue and saturation
  func adjusting(lightness: CGFloat, alpha: CGFloat) -> NSColor {
    let (hue, saturation, currentLightness, currentAlpha) = hsla
    if lightness == currentLightness, alpha == currentAlpha {
      return self
    }
    return NSColor(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha)
  }

  /// The HSLA (hue, saturation, lightness, alpha) components of the color.
  // swiftlint:disable large_tuple
  var hsla: (CGFloat, CGFloat, CGFloat, CGFloat) {
    var (h, s, b, a) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
    getHue(&h, saturation: &s, brightness: &b, alpha: &a)

    let l = ((2.0 - s) * b) / 2.0

    switch l {
    case 0.0, 1.0:
      s = 0.0
    case 0.0..<0.5:
      s = (s * b) / (l * 2.0)
    default:
      s = (s * b) / (2.0 - l * 2.0)
    }

    return (h * 360.0, s * 100.0, l * 100.0, a)
  }

  /// Converts HSL to RGB (Source: https://en.wikipedia.org/wiki/HSL_and_HSV)
  convenience init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat = 1) {
    assert(hue >= 0 && hue <= 360, "Invalid hue component")
    assert(saturation >= 0 && saturation <= 100, "Invalid saturation component")
    assert(lightness >= 0 && lightness <= 100, "Invalid lightness component")
    assert(alpha >= 0 && alpha <= 1, "Invalid alpha component")

    let h = hue / 360
    let s = saturation / 100
    let l = lightness / 100

    self.init(
      hue: h,
      saturation: hsbSaturation(saturation: s, lightness: l),
      brightness: hsbBrightness(saturation: s, lightness: l),
      alpha: alpha
    )
  }
}

// MARK: - Helpers

private func hsbSaturation(saturation: CGFloat, lightness: CGFloat) -> CGFloat {
  let hsbSaturation = saturation * ((lightness < 0.5) ? lightness : 1 - lightness)
  return (2 * hsbSaturation / (lightness + hsbSaturation))
}

private func hsbBrightness(saturation: CGFloat, lightness: CGFloat) -> CGFloat {
  let hsbSaturation = saturation * ((lightness < 0.5) ? lightness : 1 - lightness)
  return lightness + hsbSaturation
}

