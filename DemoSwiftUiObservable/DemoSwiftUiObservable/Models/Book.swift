//
//  Book.swift
//  DemoSwiftUiObservable
//
//  Created by Vishnu Prabhu Rama Chandran on 16/7/23.
//

import Foundation

class Book : ObservableObject, Identifiable {
    let id = UUID()
    
    @Published var title = "Sample Book Title"
}
