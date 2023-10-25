//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 24/10/23.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundStyle(.gray)
                Spacer()
                if let content {
                    Text(content)
                } else if let linkLabel = linkLabel, let linkDestination = linkDestination {
                    Link(linkLabel, destination: URL(string: "https://\(linkDestination)")!)
                    Image(systemName: "arrow.up.right.square").foregroundStyle(.pink)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

#Preview {
    Group {
        SettingsRowView(name: "Developer", content: "John / Jane")
            .padding()
        SettingsRowView(name: "Developer", linkLabel: "Wikipedia", linkDestination: "https://wikipedia.com")
            .padding()
    }
}
