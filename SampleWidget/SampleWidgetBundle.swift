//
//  SampleWidgetBundle.swift
//  SampleWidget
//
//  Created by Asif on 28/01/23.
//  Copyright © 2023 SkyDevz. All rights reserved.
//

import WidgetKit
import SwiftUI

@main
struct SampleWidgetBundle: WidgetBundle {
  var body: some Widget {
    SampleWidget()
    if #available(iOS 16.1, *) {
      SampleWidgetLiveActivity()
    }
  }
}
