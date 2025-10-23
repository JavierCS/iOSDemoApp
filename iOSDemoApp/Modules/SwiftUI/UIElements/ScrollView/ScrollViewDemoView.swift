//
//  ScrollViewDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

enum ScrollViewDemoViewAxis {
    case vertical
    case horizontal
    case both
}

struct ScrollViewDemoView: View {
    @State private var currentAxis: ScrollViewDemoViewAxis = .vertical
    
    var squareScroll: some View {
        ScrollView([.horizontal, .vertical]) {
            HStack {
                VStack {
                    Image(systemName: "arrow.down.right")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                    Image(systemName: "arrow.up.right")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                
                VStack {
                    Image(systemName: "arrow.down")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                    
                    ZStack {
                        Group {
                            Image(systemName: "arrow.up.left.and.arrow.down.right").resizable()
                            Image(systemName: "arrow.down.left.and.arrow.up.right").resizable()
                        }
                        .frame(width: 100, height: 100)
                    }
                    .padding(250)
                    
                    Image(systemName: "arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                }
                
                VStack {
                    Image(systemName: "arrow.down.left")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Spacer()
                    Image(systemName: "arrow.up.left")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
        .defaultScrollAnchor(.center)
    }
    
    var verticalScroll: some View {
        ScrollView {
            VStack(spacing: 500) {
                Text("Scroll View Top")
                    .font(.title)
                Image(systemName: "arrow.down")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("Scroll View Bottom")
                    .font(.title)
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
    }
    
    var horizontalScroll: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 100) {
                Text("Scroll View Top")
                    .font(.title)
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("Scroll View Bottom")
                    .font(.title)
            }
            .padding()
            .frame(maxHeight: .infinity)
        }
    }
    
    var body: some View {
        getScrollView()
        .navigationTitle("Scroll View")
        .navigationBarTitleDisplayMode(.inline)
        .background {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Picker("Axis", selection: $currentAxis) {
                        Label("Vertical", systemImage: "arrow.up.arrow.down").tag(ScrollViewDemoViewAxis.vertical)
                        Label("Horizontal", systemImage: "arrow.left.arrow.right").tag(ScrollViewDemoViewAxis.horizontal)
                        Label {
                            Text("Both")
                        } icon: {
                            ZStack {
                                Image(systemName: "arrow.up.left.and.arrow.down.right")
                                Image(systemName: "arrow.down.left.and.arrow.up.right")
                            }
                        }.tag(ScrollViewDemoViewAxis.both)
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                }

            }
        }
    }
    
    @ViewBuilder private func getScrollView() -> some View {
        switch currentAxis {
        case .vertical:
            verticalScroll
        case .horizontal:
            horizontalScroll
        case .both:
            squareScroll
        }
    }
}

#Preview {
    NavigationStack {
        ScrollViewDemoView()
    }
}
