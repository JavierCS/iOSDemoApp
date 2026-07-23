//
//  ScrollHintsView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 22/07/26.
//

import SwiftUI

struct ScrollHintsView: View {
    @State private var items = SimpleListItem.allCases
    
    var body: some View {
        content
            .navigationTitle("Scroll Hints")
    }
    
    var content: some View {
        VStack {
            scrollHint
            Spacer()
        }
    }
    
    var scrollHint: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    Spacer()
                        .frame(width: 16)
                        .id("Start")
                    ForEach(items) { item in
                        Button {
                            
                        } label: {
                            Text(item.description)
                        }
                        .buttonStyle(.borderedProminent)
                        .id(item)
                    }
                    Spacer()
                        .frame(width: 16)
                        .id("End")
                }
                .padding(.vertical)
            }
            .onAppear {
                animate(using: proxy)
            }
        }
    }
    
    func animate(using proxy: ScrollViewProxy) {
        proxy.scrollTo("End", anchor: .trailing)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let customCurve = Animation.timingCurve(0.35, 0.50, 0.15, 1.0, duration: 2.0)
            withAnimation(customCurve) {
                proxy.scrollTo("Start", anchor: .leading)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ScrollHintsView()
    }
}
