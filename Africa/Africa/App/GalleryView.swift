//
//  GalleryView.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 25/10/23.
//

import SwiftUI

struct GalleryView: View {
    
    //let gridLayout = Array(repeating: GridItem(.flexible(minimum: 0, maximum: .infinity)), count: 3)
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridItems = 3.0
    @State private var isAnimating = false
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridItems))
    }
    
    @State private var selectedAnimal: String = "lion"
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8.0))
                
                Slider(value: $gridItems, in: 2...4, step: 1)
                    .onChange(of: gridItems) { _, _ in
                        gridSwitch()
                        isAnimating.toggle()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    } //:ForEach
                } //:LazyVGrid
                .animation(.easeOut, value: isAnimating)
            } //:VStack
        }
        .background(MotionAnimationView())
        .onAppear {
            gridSwitch()
        }
    }
}

#Preview {
    GalleryView()
}
