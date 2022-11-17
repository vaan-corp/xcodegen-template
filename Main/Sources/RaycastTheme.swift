//
//  RaycastTheme.swift
//  Color Palette
//
//  Created by Imthath on 17/11/22.
//  Copyright © 2022 SkyDevz. All rights reserved.
//


import AppKit

public protocol RaycastTheme {
  // used to uniquely identify the theme. (Not required until we support custom themes)
  var identifier: String { get }

  // primary colors
  var background: NSColor { get }
  var secondaryBackground: NSColor { get }
  var foreground: NSColor { get }
  var accent: NSColor { get }
  var selection: NSColor { get }
  var loader: NSColor { get }

  // secondary colors
  var red: NSColor { get }
  var orange: NSColor { get }
  var yellow: NSColor { get }
  var green: NSColor { get }
  var blue: NSColor { get }
  var purple: NSColor { get }
  var magenta: NSColor { get }
}

public struct DefaultTheme: RaycastTheme {
  public init() {}
}
public extension DefaultTheme {
  var identifier: String { "bundled-default-theme" }

  var background: NSColor { NSColor(rgb: 0x262626) }
  var secondaryBackground: NSColor { NSColor(rgb: 0x262626) }
  var foreground: NSColor { NSColor(rgb: 0xE6E6E6) }
  var accent: NSColor { NSColor(rgb: 0xA3A3A3) }
  var selection: NSColor { NSColor(rgb: 0xBFBFBF) }
  var loader: NSColor { NSColor(rgb: 0xA3A3A3) }

  var red: NSColor { NSColor(rgb: 0xFF4769) }
  var orange: NSColor { NSColor(rgb: 0xFF6647) }
  var yellow: NSColor { NSColor(rgb: 0xF6FF47) }
  var green: NSColor { NSColor(rgb: 0x47FF9A) }
  var blue: NSColor { NSColor(rgb: 0x47EDFF) }
  var purple: NSColor { NSColor(rgb: 0x7847FF) }
  var magenta: NSColor { NSColor(rgb: 0xFF47C2) }
}

public struct SkyTheme: RaycastTheme {
  public init() {}
}
public extension SkyTheme {
  var identifier: String { "bundled-sky-theme" }

  var background: NSColor { NSColor(rgb: 0x00114D) }
  var secondaryBackground: NSColor { NSColor(rgb: 0x004D4C) }
  var foreground: NSColor { NSColor(rgb: 0xFFDFCC) }
  var accent: NSColor { NSColor(rgb: 0x9847FF) }
  var selection: NSColor { NSColor(rgb: 0x809CFF) }
  var loader: NSColor { NSColor(rgb: 0x47FFFF) }

  var red: NSColor { NSColor(rgb: 0xED5A5A) }
  var orange: NSColor { NSColor(rgb: 0xED865A) }
  var yellow: NSColor { NSColor(rgb: 0xEDD55A) }
  var green: NSColor { NSColor(rgb: 0x5AED7A) }
  var blue: NSColor { NSColor(rgb: 0x5AC9ED) }
  var purple: NSColor { NSColor(rgb: 0x775AED) }
  var magenta: NSColor { NSColor(rgb: 0xED5AB2) }
}

public struct SunsetTheme: RaycastTheme {
  public init() {}
}
public extension SunsetTheme {
  var identifier: String { "bundled-sunset-theme" }

  var background: NSColor { NSColor(rgb: 0x0A1A43) }
  var secondaryBackground: NSColor { NSColor(rgb: 0x0A3943) }
  var foreground: NSColor { NSColor(rgb: 0xD8F0F4) }
  var accent: NSColor { NSColor(rgb: 0xFF9447) }
  var selection: NSColor { NSColor(rgb: 0x8CA9F2) }
  var loader: NSColor { NSColor(rgb: 0x47E0FF) }

  var red: NSColor { NSColor(rgb: 0xED5A5A) }
  var orange: NSColor { NSColor(rgb: 0xED865A) }
  var yellow: NSColor { NSColor(rgb: 0xEDD55A) }
  var green: NSColor { NSColor(rgb: 0x5AED7A) }
  var blue: NSColor { NSColor(rgb: 0x5AC9ED) }
  var purple: NSColor { NSColor(rgb: 0x775AED) }
  var magenta: NSColor { NSColor(rgb: 0xED5AB2) }
}

extension RaycastTheme {
//  func color(base: RaycastColor, appearance: RaycastAppearance, alphaScale: AlphaScale) -> NSColor {
//    nsColor(for: base).adjusting(lightness: appearance.lightness(for: base), alpha: alphaScale.value)
//  }

  func dynamicColor(base: RaycastColor, alphaScale: AlphaScale) -> NSColor {
    NSColor(name: base.rawValue + alphaScale.rawValue) { appearance in
      var app: RaycastAppearance {
        switch appearance.bestMatch(from: [.aqua, .darkAqua]) {
        case .some(.darkAqua): return .dark
        default: return .light
        }
      }
      return nsColor(for: base).adjusting(lightness: app.lightness(for: base), alpha: alphaScale.value)
    }
  }
}

