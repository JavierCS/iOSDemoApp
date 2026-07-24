//
//  ScrollHintView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 22/07/26.
//

import SwiftUI

enum ScrollHintViewBehavior {
    case none
    case onAppear
    case limitedOnAppear(key: String, maxCount: Int)
    case onAction(animate: Binding<Bool>)
}

struct ScrollHintView: View {
    let items: [SimpleListItem]
    let behavior: ScrollHintViewBehavior
    @Binding var animate: Bool
    
    init(
        items: [SimpleListItem],
        behavior: ScrollHintViewBehavior = .none
    ) {
        self.items = items
        self.behavior = behavior
        guard case let .onAction(animateBinding) = behavior else {
            _animate = .constant(false)
            return
        }
        _animate = animateBinding
    }
    
    var body: some View {
        content
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
                        .frame(width: 0)
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
                        .frame(width: 0)
                        .id("End")
                }
                .fixedSize()
                .padding(.vertical)
            }
            .padding(0)
            .onAppear {
                if case .onAppear = behavior {
                    animate(using: proxy)
                } else if case let .limitedOnAppear(key, maxCount) = behavior {
                    let count = UserDefaults.standard.integer(forKey: key)
                    guard count <= maxCount else { return }
                    animate(using: proxy)
                    UserDefaults.standard.set(count + 1, forKey: key)
                }
            }
            .onChange(of: animate) { value in
                guard value else { return }
                animate(using: proxy)
            }
        }
        .padding(0)
    }
    
    func animate(using proxy: ScrollViewProxy) {
        proxy.scrollTo("End", anchor: .trailing)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let customCurve = Animation.timingCurve(0.35, 0.50, 0.15, 1.0, duration: 2.0)
            withAnimation(customCurve) {
                proxy.scrollTo("Start", anchor: .leading)
                animate = false
            }
        }
    }
}

#Preview("onAppearBehavior") {
    NavigationStack {
        ScrollHintView(items: SimpleListItem.allCases, behavior: .onAppear)
    }
}

struct ScrollHintView_Preview: PreviewProvider {
    struct PreviewWrapper: View {
        let items: [SimpleListItem] = SimpleListItem.allCases
        @State private var animate: Bool = false
        
        var body: some View {
            VStack {
                ScrollHintView(items: items, behavior: .onAction(animate: $animate))
                Spacer()
                Button("Animate") {
                    animate = true
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
    
    static var previews: some View {
        PreviewWrapper()
            .previewDisplayName("onActionBehavior")
    }
}
