//
//  SampleWidgetLiveActivity.swift
//  SampleWidget
//
//  Created by Asif on 28/01/23.
//  Copyright © 2023 SkyDevz. All rights reserved.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SampleWidgetAttributes: ActivityAttributes {
  public struct ContentState: Codable, Hashable {
    // Dynamic stateful properties about your activity go here!
    var value: Int
  }
  
  // Fixed non-changing properties about your activity go here!
  var name: String
}

@available(iOSApplicationExtension 16.1, *)
struct SampleWidgetLiveActivity: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: SampleWidgetAttributes.self) { context in
      // Lock screen/banner UI goes here
      VStack {
        Text("Hello")
      }
      .activityBackgroundTint(Color.cyan)
      .activitySystemActionForegroundColor(Color.black)
      
    } dynamicIsland: { context in
      DynamicIsland {
        // Expanded UI goes here.  Compose the expanded UI through
        // various regions, like leading/trailing/center/bottom
        DynamicIslandExpandedRegion(.leading) {
          Text("Leading")
        }
        DynamicIslandExpandedRegion(.trailing) {
          Text("Trailing")
        }
        DynamicIslandExpandedRegion(.bottom) {
          Text("Bottom")
          // more content
        }
      } compactLeading: {
        Text("L")
      } compactTrailing: {
        Text("T")
      } minimal: {
        Text("Min")
      }
      .widgetURL(URL(string: "http://www.apple.com"))
      .keylineTint(Color.red)
    }
  }
}
