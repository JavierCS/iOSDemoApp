//
//  LabelDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

struct LabelDemoView: View {
    var body: some View {
        List {
            Section("Initialization") {
                getLabel()
                getComposedLabel()
            }
            
            Section("Modifiers") {
                VStack {
                    Text("Label Icon To Title Spacing")
                    getLabel()
                        .labelIconToTitleSpacing(40)
                }
                .frame(maxWidth: .infinity)
            }
            
            Section("Styles") {
                VStack {
                    Text("Icon Only")
                    getLabel()
                        .labelStyle(.iconOnly)
                    
                    Divider()
                        .padding(.vertical)
                    
                    Text("Title Only")
                    getLabel()
                        .labelStyle(.titleOnly)
                    
                    Divider()
                        .padding(.vertical)
                    
                    Text("Title And Icon")
                    getLabel()
                        .labelStyle(.titleAndIcon)
                }
                .frame(maxWidth: .infinity, )
            }
            
            Section("Custom Styles") {
                VStack {
                    Text("Leading Icon Style")
                    getLabel()
                        .labelStyle(LeadingIconLabelStyle())
                    
                    Divider()
                    
                    Text("Top Icon Style")
                    getLabel()
                        .labelStyle(TopIconLabelStyle())
                    
                    Divider()
                    
                    Text("Bottom Icon Style")
                    getLabel()
                        .labelStyle(BottomIconLabelStyle())
                    
                    Divider()
                    
                    Text("Red Bordered Label Style")
                    getLabel()
                        .labelStyle(RedBorderedLabelStyle())
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle("Label")
    }
    
    @ViewBuilder
    private func getLabel() -> some View {
        Label("Label", systemImage: "swift")
    }
    
    @ViewBuilder
    private func getComposedLabel() -> some View {
        Label {
            Text("Body")
                .font(.body)
                .foregroundStyle(.primary)
            Text("Subheadline")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        } icon: {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 44, height: 44, alignment: .center)
                .overlay {
                    Text("B")
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    NavigationStack {
        LabelDemoView()
    }
}
