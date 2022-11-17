//
//  HomeView.swift
//  Color Palette
//
//  Created by Imthath on 17/11/22.
//  Copyright © 2022 SkyDevz. All rights reserved.
//

import SwiftUI

struct ThemeView: View {
  var theme: RaycastTheme {
    switch themeName {
    case "blue": return SkyTheme()
    case "sunset": return SunsetTheme()
    default: return DefaultTheme()
    }
  }
  @State var themeName: String = "default"

  var body: some View {
    Group {
      HStack {
        Text("You selected \(themeName) theme")
          .padding(.horizontal)
        Spacer()
        Picker("Theme", selection: $themeName) {
          Text("Default").tag("default")
          Text("Blue").tag("blue")
          Text("Sunset").tag("sunset")
        }
          .pickerStyle(SegmentedPickerStyle())
          .frame(width: 500)
      }
        .padding()
      switch themeName {
      case "blue": ThemeGrid(theme: SkyTheme())
      case "sunset": ThemeGrid(theme: SunsetTheme())
      default: ThemeGrid(theme: DefaultTheme())
      }
      // doesn't work as expected
//      ThemeGrid(them: theme)
    }
      .frame(width: 1500, height: 1500)
//      .environment(\.colorScheme, .light)
  }
}

struct ThemeGrid: View {
  let theme: RaycastTheme
  let appearance: RaycastAppearance = .dark
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    VStack {
//      Text(appearance.rawValue)
      Text("System Appearance " + (colorScheme == .dark ? "Dark" : "Light"))
        .font(.title)
        .padding()
      ForEach(RaycastColor.allCases, id: \.self) { color in
        AlphaRow(theme: theme, appearance: appearance, base: color)
      }
    }
      .padding(.vertical, 100)
  }
}

struct AlphaRow: View {
  let theme: any RaycastTheme
  let appearance: RaycastAppearance
  let base: RaycastColor

  var body: some View {
    HStack {
      ForEach(AlphaScale.allCases, id: \.self) { alphaScale in
        VStack {
          square(for: theme.dynamicColor(base: base, alphaScale: alphaScale))
            .frame(width: 150)
          Text(base.rawValue + alphaScale.rawValue)
            .font(.footnote)
        }
      }
    }
  }

  func square(for color: NSColor) -> some View {
    Color(color)
      .frame(width: 64, height: 64)
      .cornerRadius(16)
  }
}
