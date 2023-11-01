//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 30/10/23.
//

import SwiftUI

struct InsetGalleryView: View {
    let animal: Animal
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \String.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        } //: ScrollView
    }
}

#Preview {
    Group {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        InsetGalleryView(animal: animals[0])
    }
}
