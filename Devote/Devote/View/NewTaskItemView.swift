//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Vishnu Prabhu Rama Chandran on 29/11/23.
//

import SwiftUI

struct NewTaskItemView: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    @Binding var isShowing: Bool
    
    var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    // MARK: - Functions
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.id = UUID()
            newItem.task = task
            newItem.completion = false
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func clearTextField() {
        task = ""
        hideKeyboard()
        isShowing = false
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New item", text: $task)
                    .padding()
                    .background(
                        isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
                    )
                    .cornerRadius(10)
                
                Button(action: {
                    addItem()
                    playSound("sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                    clearTextField()
                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisabled)
                .onTapGesture {
                    if isButtonDisabled {
                        playSound("sound-tap", type: "mp3")
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ? .gray : .pink)
                .cornerRadius(10)
            }//: VStack
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : .white
            )
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.65), radius:24)
            .frame(maxWidth: 640)
        }//: VStack
        .padding()
    }
}

#Preview {
    NewTaskItemView(isShowing: .constant(false))
        .background(Color.gray.edgesIgnoringSafeArea(.all))
}
