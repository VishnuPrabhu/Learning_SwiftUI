//
//  RatingsSizesDetailView.swift
//  TouchDown
//
//  Created by Vishnu Prabhu Rama Chandran on 8/11/23.
//

import SwiftUI

struct RatingsSizesDetailView: View {
    
    private let sizes: [String] = ["XS", "S", "M", "L", "XL"]
    
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            VStack(alignment: .leading, spacing: 3) {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorGray)
                
                HStack(alignment: .center, spacing: 3) {
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .frame(width: 28, height: 28, alignment: .center)
                            .background(colorGray.cornerRadius(5))
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 3) {
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.heavy)
                    .foregroundColor(colorGray)
                
                HStack(alignment: .top, spacing: 5) {
                    ForEach(sizes, id: \.self) { s in
                        Button(action: {}, label: {
                            Text(s)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundStyle(colorGray)
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.white.cornerRadius(5))
                                .background(RoundedRectangle(cornerRadius: 5).stroke(colorGray, lineWidth: 2))
                        })
                    }
                }
            }
        }//:HStack
    }
}

#Preview {
    RatingsSizesDetailView()
        .padding()
}
