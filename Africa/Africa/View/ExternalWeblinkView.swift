//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 30/10/23.
//

import SwiftUI

struct ExternalWeblinkView: View {
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                    Image(systemName: "arrow.up.right.square")
                }
            }
        }
    }
}

#Preview {
    Group {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        ExternalWeblinkView(animal: animals[0])
    }
}
