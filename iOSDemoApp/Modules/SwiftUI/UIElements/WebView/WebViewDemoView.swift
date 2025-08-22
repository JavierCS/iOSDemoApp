//
//  WebViewDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI
import WebKit

struct WebViewDemoView: View {
    @State private var page = WebPage()
    
    var body: some View {
        WebView(page)
            .onAppear {
                page.load(URL(string: "https://developer.apple.com/"))
            }
    }
}

#Preview {
    NavigationStack {
        WebViewDemoView()
    }
}
