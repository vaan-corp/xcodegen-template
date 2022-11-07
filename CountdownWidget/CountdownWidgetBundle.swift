//
//  CountdownWidgetBundle.swift
//  CountdownWidget
//
//  Created by Imthathullah on 05/11/22.
//  Copyright © 2022 SkyDevz. All rights reserved.
//

import WidgetKit
import SwiftUI

@main
struct CountdownWidgetBundle: WidgetBundle {
    var body: some Widget {
        CountdownWidget()
        CountdownWidgetLiveActivity()
    }
}
