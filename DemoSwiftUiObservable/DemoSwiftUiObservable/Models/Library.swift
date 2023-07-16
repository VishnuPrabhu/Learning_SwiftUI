//
//  Library.swift
//  DemoSwiftUiObservable
//
//  Created by Vishnu Prabhu Rama Chandran on 16/7/23.
//

import Foundation

class Library : ObservableObject {
    @Published var books: [Book] = [Book(), Book(), Book()]
}
