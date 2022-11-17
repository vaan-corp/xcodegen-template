//
//  HomeView.swift
//  Color Palette
//
//  Created by Imthath on 17/11/22.
//  Copyright © 2022 SkyDevz. All rights reserved.
//

import SwiftUI

struct HomeView: View {
  @State var themeName: String = "default"

  var body: some View {
    Group {
      HStack {
        Text("You selected \(themeName) theme")
          .padding(.horizontal)
        Spacer()
        Picker("Theme", selection: $themeName) {
          Text("Default").tag("default")
          Text("Sky").tag("sky")
          Text("Sunset").tag("sunset")
        }
          .pickerStyle(SegmentedPickerStyle())
          .frame(width: 500)
      }
        .padding()
      switch themeName {
      case "sky": PaletteGridView(theme: SkyTheme())
      case "sunset": PaletteGridView(theme: SunsetTheme())
      default: PaletteGridView(theme: DefaultTheme())
      }
    }
      .frame(width: 1500, height: 1500)
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
