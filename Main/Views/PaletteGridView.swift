//
//  PaletteGridView.swift
//  Color Palette
//
//  Created by Imthath on 17/11/22.
//  Copyright © 2022 SkyDevz. All rights reserved.
//

import SwiftUI

struct PaletteGridView: View {
  let theme: RaycastTheme
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    VStack {
      Text("System Appearance " + (colorScheme == .dark ? "Dark" : "Light"))
        .font(.title)
        .padding()
      ForEach(RaycastColor.allCases, id: \.self) { color in
        PaletteRowView(theme: theme, base: color)
      }
    }
      .padding(.vertical, 100)
  }
}

struct PaletteGridView_Previews: PreviewProvider {
    static var previews: some View {
        PaletteGridView(theme: SunsetTheme())
    }
}
