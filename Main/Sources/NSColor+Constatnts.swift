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
  
  static var raycastLink: NSColor{ .dynamicColor(.accent, ._100) }
  static var raycastInternalAppFlavor: NSColor { .dynamicColor(.blue, ._100) }
  static var raycastDebugAppFlavor: NSColor { .dynamicColor(.yellow, ._100) }
  static var raycastSwitchOnBackground: NSColor { .dynamicColor(.accent, ._100) }
  static var raycastSwitchOffBackground: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastSwitchKnob: NSColor { .dynamicColor(.background, ._100) }
  static var raycastToolbarBackground: NSColor { .dynamicColor(.background, ._500) }
  static var raycastPreferencesHeader: NSColor { .dynamicColor(.background, ._500) }
  static var raycastToastHUDBackground: NSColor { .dynamicColor(.background, ._500) }
  static var raycastToastBackground: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastActionBarBackground: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastCommandPaletteBackground: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastInnerPanelBackground: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastTooltipBackground: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastListSelectionBackground: NSColor { .dynamicColor(.selection, ._600) }
  static var raycastListHoverBackground: NSColor { .dynamicColor(.selection, ._700) }
  static var raycastSeparator: NSColor { .dynamicColor(.foreground, ._800) }
  static var raycastFieldBorder: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastFieldHoverBorder: NSColor { .dynamicColor(.foreground, ._300) }
  static var raycastGridItemHoverBorder: NSColor { .dynamicColor(.foreground, ._300) }
  static var raycastFieldFocusBorder: NSColor { .dynamicColor(.accent, ._100) }
  static var raycastTokenFocusBorder: NSColor { .dynamicColor(.accent, ._100) }
  static var raycastGridSelectionBorder: NSColor { .dynamicColor(.accent, ._100) }
  static var raycastFieldDisabled: NSColor { .dynamicColor(.foreground, ._600) }
  static var raycastButtonBackground: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastTokenBackground: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastPrimaryText: NSColor { .dynamicColor(.foreground, ._100) }
  static var raycastSecondaryText: NSColor { .dynamicColor(.foreground, ._300) }
  static var raycastTertiaryText: NSColor { .dynamicColor(.foreground, ._400) }
  static var raycastQuaternaryText: NSColor { .dynamicColor(.foreground, ._500) }
  static var raycastPlaceholderText: NSColor { .dynamicColor(.foreground, ._700) }
  static var raycastSearchBarLoadingIndicator: NSColor { .dynamicColor(.loader, ._100) }
  static var raycastActionBarProgress: NSColor { .dynamicColor(.loader, ._100) }
  static var raycastProgressCircle: NSColor { .dynamicColor(.loader, ._100) }
  static var raycastInfoForeground: NSColor { .dynamicColor(.blue, ._100) }
  static var raycastInfoBackground: NSColor { .dynamicColor(.blue, ._600) }
  static var raycastSuccessForeground: NSColor { .dynamicColor(.green, ._100) }
  static var raycastSuccessBackground: NSColor { .dynamicColor(.green, ._600) }
  static var raycastWarningForeground: NSColor { .dynamicColor(.yellow, ._100) }
  static var raycastWarningBackground: NSColor { .dynamicColor(.yellow, ._600) }
  static var raycastErrorForeground: NSColor { .dynamicColor(.red, ._100) }
  static var raycastErrorBackground: NSColor { .dynamicColor(.red, ._600) }
  static var raycastComingSoonForeground: NSColor { .dynamicColor(.foreground, ._100) }
  static var raycastComingSoonBackground: NSColor { .dynamicColor(.accent, ._600) }
  
}

