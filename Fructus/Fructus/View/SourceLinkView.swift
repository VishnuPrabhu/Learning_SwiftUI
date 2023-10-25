//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 23/10/23.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox {
            HStack {
                Text("Content Source")
                Spacer()
                Link("Wikipedia", destination: URL(string: "https://www.wikipedia.com")!)
                Image(systemName: "arrow.up.right.square")
            } //: Hstack
            .font(.footnote)
        } //: Groupbox
    }
}

#Preview {
    SourceLinkView()
        .padding()
}
