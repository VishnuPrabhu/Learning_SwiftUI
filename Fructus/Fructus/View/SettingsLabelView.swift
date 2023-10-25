//
//  SettingLabelView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 24/10/23.
//

import SwiftUI

struct SettingsLabelView: View {
    let labelText: String
    let labelImage: String
    
    var body: some View {
        HStack {
            Text(labelText.uppercased()).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

#Preview {
    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
}
