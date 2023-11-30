//
//  ListRowItemView.swift
//  Devote
//
//  Created by Vishnu Prabhu Rama Chandran on 30/11/23.
//

import SwiftUI

struct ListRowItemView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var item: Item
    
    var body: some View {
        Toggle(isOn: $item.completion) {
            Text(item.task ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(item.completion ? .pink : .primary)
                .padding(.vertical, 12)
                .animation(.default, value: item.completion)
        }
        .toggleStyle(CheckboxStyle())
        .onReceive(item.objectWillChange) {
            if viewContext.hasChanges {
                try? viewContext.save()
            }
        }
    }
}
