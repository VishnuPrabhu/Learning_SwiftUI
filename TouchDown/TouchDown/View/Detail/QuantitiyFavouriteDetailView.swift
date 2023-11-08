//
//  QuantitiyFavouriteDetailView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 8/11/23.
//

import SwiftUI

struct QuantitiyFavouriteDetailView: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button(action: {
                if counter > 0 {
                    feedback.impactOccurred()
                    counter -= 1
                }
            }, label: {
                Image(systemName: "minus.circle")
            })
            
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)
            
            Button(action: {
                if counter < 100 {
                    feedback.impactOccurred()
                    counter += 1
                }
            }, label: {
                Image(systemName: "plus.circle")
            })
            
            Spacer()
            
            Button(action: {
                feedback.impactOccurred()
            }, label: {
                Image(systemName: "heart.circle")
                    .foregroundColor(.pink)
            })
        }
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

#Preview {
    QuantitiyFavouriteDetailView()
        .padding()
}
