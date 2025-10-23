//
//  TextDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 11/08/25.
//

import SwiftUI

struct TextDemoView: View {
    var body: some View {
        list
            .navigationTitle("Text")
    }
    
    var list: some View {
        List {
            Section("Fonts") {
                Text("Large Title")
                    .font(.largeTitle)
                Text("Title")
                    .font(.title)
                Text("Title2")
                    .font(.title2)
                Text("Title3")
                    .font(.title3)
                Text("Headline")
                    .font(.headline)
                Text("Subheadline")
                    .font(.subheadline)
                Text("Body")
                    .font(.body)
                Text("Callout")
                    .font(.callout)
                Text("Footnote")
                    .font(.footnote)
                Text("Caption")
                    .font(.caption)
                Text("Caption 2")
                    .font(.caption2)
            }
            
            Section("Font Weight") {
                Text("Black").fontWeight(.black)
                Text("Heavy").fontWeight(.heavy)
                Text("Bold").fontWeight(.bold)
                Text("Semibold").fontWeight(.semibold)
                Text("Medium").fontWeight(.medium)
                Text("Regular").fontWeight(.regular)
                Text("Light").fontWeight(.light)
                Text("Thin").fontWeight(.thin)
                Text("Ultra Light").fontWeight(.ultraLight)
            }
            
            Section("Font Width") {
                Text("Compressed").fontWidth(.compressed)
                Text("Condensed").fontWidth(.condensed)
                Text("Standar").fontWidth(.standard)
                Text("Expanded").fontWidth(.expanded)
            }
            
            Section("Font Design") {
                Text("Default").fontDesign(.default)
                Text("Monospaced").fontDesign(.monospaced)
                Text("Rounded").fontDesign(.rounded)
                Text("Serif").fontDesign(.serif)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TextDemoView()
    }
}
