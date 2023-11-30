//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Vishnu Prabhu Rama Chandran on 30/11/23.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    feedback.notificationOccurred(.success)
                    
                    if (configuration.isOn) {
                        playSound("sound-rise", type: "mp3")
                    } else {
                        playSound("sound-tap", type: "mp3")
                    }
                }
            
            configuration.label
        }
    }
}

#Preview {
    Toggle("Placeholder", isOn: .constant(true))
        .toggleStyle(CheckboxStyle())
        .padding()
}
