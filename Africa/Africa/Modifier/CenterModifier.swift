//
//  CenterModifier.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 2/11/23.
//

import SwiftUI

struct CenterModifier : ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content.background()
            Spacer()
        }
    }
}
