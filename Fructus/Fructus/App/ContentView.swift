//
//  ContentView.swift
//  Fructus
//
//  Created by Vishnu Prabhu Rama Chandran on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.fruitsData) var fruits: [Fruit]
    
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink(value: item, label: {
                        FruitRowView(fruit: item)
                            .padding(.vertical, 4)
                    })
                }
            }
            .navigationTitle("Fruits")
            .navigationDestination(for: Fruit.self) { item in
                FruitDetailView(fruit: item)
            }
            .navigationBarItems(trailing: Button(action: {
                isShowingSheet = true
            }) {
                Image(systemName: "slider.horizontal.3")
            })
            .sheet(isPresented: $isShowingSheet, content: {
                SettingsView()
            })
        }
    }
}

#Preview {
    ContentView()
        .environment(\.fruitsData, fruitsData)
}
