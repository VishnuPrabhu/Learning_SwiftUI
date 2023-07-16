//
//  DemoSwiftUiObservableApp.swift
//  DemoSwiftUiObservable
//
//  Created by Vishnu Prabhu Rama Chandran on 16/7/23.
//

import SwiftUI

@main
struct DemoSwiftUiObservableApp: App {
    @StateObject private var library = Library()
    
    var body: some Scene {
        WindowGroup {
            LibraryView()
                .environmentObject(library)
        }
    }
}
