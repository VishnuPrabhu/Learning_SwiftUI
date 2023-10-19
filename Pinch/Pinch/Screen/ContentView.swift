//
//  ContentView.swift
//  Pinch
//
//  Created by Vishnu Prabhu Rama Chandran on 18/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false
    
    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 1
    
    private func resetImageState() {
        withAnimation(.spring()) {
            imageOffset = .zero
            imageScale = 1
        }
    }
    
    var currentPage: String {
        pages[pageIndex - 1].imageName
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Fills the available space
                Color.clear
                
                Image(currentPage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .offset(imageOffset)
            .scaleEffect(imageScale)
            .onTapGesture(count: 2, perform: {
                if (imageScale == 1) {
                    withAnimation(.spring()) {
                        imageScale = 5
                    }
                } else {
                    withAnimation(.spring()) {
                        resetImageState()
                    }
                }
            })
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.spring()) {
                            imageOffset = value.translation
                        }
                    }
                    .onEnded { _ in
                        if imageScale <= 1 {
                            resetImageState()
                        }
                    }
            )
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        withAnimation(.linear(duration: 1)) {
                            if imageScale >= 1 && imageScale <= 5 {
                                imageScale = value
                            }
                            if imageScale > 5 {
                                imageScale = 5
                            }
                        }
                    }
                    .onEnded { _ in
                        if imageScale > 5 {
                            imageScale = 5
                        } else if imageScale <= 1 {
                            resetImageState()
                        }
                    }
            )
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
            .overlay(
                InfoPanelView(imageScale: imageScale, imageOffset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            .overlay(
                Group {
                    HStack {
                        Button {
                            if imageScale > 1 {
                                withAnimation(.spring()) {
                                    imageScale -= 1
                                    
                                    if imageScale == 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        
                        Button {
                            resetImageState()
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        Button {
                            if imageScale < 5 {
                                withAnimation(.spring()) {
                                    imageScale += 1
                                    
                                    if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                    }
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                }
                    .padding(.bottom, 30)
                , alignment: .bottom
            )
            .overlay(
                HStack(spacing: 8) {
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" :  "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        })
                    
                    ForEach(pages) { page in
                        Image(page.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .opacity(isDrawerOpen ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                            .onTapGesture(perform: {
                                isAnimating = true
                                pageIndex = page.id
                            })
                    }
                    Spacer()
                }
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing
            )
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}

