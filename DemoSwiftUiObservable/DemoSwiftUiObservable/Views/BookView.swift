//
//  BookView.swift
//  DemoSwiftUiObservable
//
//  Created by Vishnu Prabhu Rama Chandran on 16/7/23.
//

import SwiftUI

struct BookView: View {
    @ObservedObject var book: Book
    @State private var isEditorPresented = false
    
    var body: some View {
        HStack {
            Text(book.title)
            Spacer()
            Button("Edit") {
                isEditorPresented = true
            }
        }
        .sheet(isPresented: $isEditorPresented) {
            BookEditView(book: book)
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: Book())
    }
}
