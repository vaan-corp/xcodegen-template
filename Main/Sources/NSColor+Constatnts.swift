//
//  NSColor+Constatnts.swift
//  Color Palette
//
//  Created by Imthath on 17/11/22.
//  Copyright © 2022 SkyDevz. All rights reserved.
//

import AppKit

public extension NSColor {
  // Constant colors which don't change based on the theme but change based on the appearance
  static var raycastBrand: NSColor { .dynamicColor(name: "raycastBrand", light: NSColor(rgb: 0xE91F1F), dark: NSColor(rgb: 0xFF6363)) }

  // Colors which change based on the theme and appearance
  static var raycastPrimaryText: NSColor { .dynamicColor(.foreground, ._100) }
  static var raycastButtonBackground: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastGridSelection: NSColor { .dynamicColor(.selection, ._100) }
}

