//
//  CitationWidgetLiveActivity.swift
//  CitationWidget
//
//  Created by Thibault GODEFROY on 20/02/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CitationWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct CitationWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CitationWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
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
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension CitationWidgetAttributes {
    fileprivate static var preview: CitationWidgetAttributes {
        CitationWidgetAttributes(name: "World")
    }
}

extension CitationWidgetAttributes.ContentState {
    fileprivate static var smiley: CitationWidgetAttributes.ContentState {
        CitationWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: CitationWidgetAttributes.ContentState {
         CitationWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: CitationWidgetAttributes.preview) {
   CitationWidgetLiveActivity()
} contentStates: {
    CitationWidgetAttributes.ContentState.smiley
    CitationWidgetAttributes.ContentState.starEyes
}
