//
//  BookEditView.swift
//  DemoSwiftUiObservable
//
//  Created by Vishnu Prabhu Rama Chandran on 16/7/23.
//

import SwiftUI

struct BookEditView: View {
    @ObservedObject var book: Book
    @Environment(\.dismiss) private var dismiss: DismissAction
    var body: some View {
        VStack {
            TextField("Title", text: $book.title)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    dismiss()
                }
            
            Button("Close") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct BookEditView_Previews: PreviewProvider {
    static var previews: some View {
        BookEditView(book: Book())
    }
}
