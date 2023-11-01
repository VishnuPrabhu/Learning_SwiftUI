//
//  InsetFactView.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 30/10/23.
//

import SwiftUI

struct InsetFactView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

#Preview {
    Group {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        InsetFactView(animal: animals[0])
    }
}
