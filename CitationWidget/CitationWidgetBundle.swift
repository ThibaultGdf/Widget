//
//  CitationWidgetBundle.swift
//  CitationWidget
//
//  Created by Thibault GODEFROY on 20/02/2024.
//

import WidgetKit
import SwiftUI

@main
struct CitationWidgetBundle: WidgetBundle {
    var body: some Widget {
        CitationWidget()
        CitationWidgetLiveActivity()
    }
}
