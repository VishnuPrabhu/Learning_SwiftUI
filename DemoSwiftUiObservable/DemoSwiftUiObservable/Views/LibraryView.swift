//
//  LibraryView.swift
//  DemoSwiftUiObservable
//
//  Created by Vishnu Prabhu Rama Chandran on 16/7/23.
//

import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var library: Library
    
    var body: some View {
        List(library.books) { book in
            BookView(book: book)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .environmentObject(Library())
    }
}
