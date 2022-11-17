//
//  PaletteRowView.swift
//  Color Palette
//
//  Created by Imthath on 17/11/22.
//  Copyright © 2022 SkyDevz. All rights reserved.
//

import SwiftUI

struct PaletteRowView: View {
  let theme: any RaycastTheme
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

struct PaletteRowView_Previews: PreviewProvider {
    static var previews: some View {
      PaletteRowView(theme: SkyTheme(), base: .accent)
    }
}
