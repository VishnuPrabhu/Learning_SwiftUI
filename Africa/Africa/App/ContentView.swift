//
//  ContentView.swift
//  Africa
//
//  Created by Vishnu Prabhu Rama Chandran on 25/10/23.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    private let haptics = UIImpactFeedbackGenerator(style: .medium)

    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        let gridSize = (gridColumn % 3) + 1
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridSize)
        gridColumn = gridSize
        
        switch gridSize {
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            } //: LINK
                        } //: LOOP
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            } //:ForEach
                        } //:LazyVGrid
                        .padding()
                        .animation(.easeIn, value: gridColumn)
                    } //:ScrollView
                }
            } //:Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }) {
                           Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            isGridViewActive = true
                            gridSwitch()
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: toolbarIcon)
                                 .font(.title2)
                                 .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                } //:ToolbarItem
            } //:toolbar
        } //:NavigationView
    }
}

#Preview {
    ContentView()
}
