//
//  DevoteWidget.swift
//  DevoteWidget
//
//  Created by Vishnu Prabhu Rama Chandran on 30/11/23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct DevoteWidgetEntryView : View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: Provider.Entry
    
    private var fontStyle: Font {
        if (widgetFamily == .systemLarge) {
            .system(.footnote, design: .rounded)
        } else {
            .system(.headline, design: .rounded)
        }
    }

    var body: some View {
        GeometryReader { frame in
            ZStack {
                backgroundGradient
                
                Image("rocket")
                    .resizable()
                    .scaledToFit()
                
                Image("logo")
                    .resizable()
                    .frame(
                        width: widgetFamily == .systemSmall ? 36 : 56,
                        height: widgetFamily == .systemSmall ? 36 : 56
                    )
                    .offset(x: (frame.size.width / 2) - 20, y: (frame.size.height / -2) + 20)
                    .padding(.top, widgetFamily == .systemSmall ? 12 : 32)
                    .padding(.trailing, widgetFamily == .systemSmall ? 12 : 32)
                
                HStack {
                    Text("Just Do It")
                        .foregroundColor(.white)
                        .font(fontStyle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                        .background(
                            .black.opacity(0.5).blendMode(.overlay)
                        )
                    .clipShape(Capsule())
                    .padding()
                    .offset(y: (frame.size.height / 2) - 24)
                    
                    if (widgetFamily != .systemSmall) {
                        Spacer()
                    }
                }
            }
        }
    }
}

struct DevoteWidget: Widget {
    let kind: String = "DevoteWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                DevoteWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                DevoteWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Devote Launcher")
        .description("This is an example widget for the personal task manager app.")
    }
}

#Preview(as: .systemSmall) {
    DevoteWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
