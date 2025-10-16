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
            Section(.init("initialization")) {
                getLabel()
                getComposedLabel()
            }
            
            Section(.init("modifiers")) {
                VStack {
                    Text(.init("labelIconToTitleSpacing"))
                    getLabel()
                        .labelIconToTitleSpacing(40)
                }
                .frame(maxWidth: .infinity)
            }
            
            Section(.init("styles")) {
                VStack {
                    Text(.init("iconOnly"))
                    getLabel()
                        .labelStyle(.iconOnly)
                    
                    Divider()
                        .padding(.vertical)
                    
                    Text(.init("titleOnly"))
                    getLabel()
                        .labelStyle(.titleOnly)
                    
                    Divider()
                        .padding(.vertical)
                    
                    Text(.init("titleAndIcon"))
                    getLabel()
                        .labelStyle(.titleAndIcon)
                }
                .frame(maxWidth: .infinity, )
            }
            
            Section(.init("customStyles")) {
                VStack {
                    Text(.init("leadingIconStyle"))
                    getLabel()
                        .labelStyle(LeadingIconLabelStyle())
                    
                    Divider()
                    
                    Text(.init("topIconStyle"))
                    getLabel()
                        .labelStyle(TopIconLabelStyle())
                    
                    Divider()
                    
                    Text(.init("bottomIconStyle"))
                    getLabel()
                        .labelStyle(BottomIconLabelStyle())
                    
                    Divider()
                    
                    Text(.init("redBorderedLabelStyle"))
                    getLabel()
                        .labelStyle(RedBorderedLabelStyle())
                }
                .frame(maxWidth: .infinity)
            }
        }
        .navigationTitle(.init("label"))
    }
    
    @ViewBuilder
    private func getLabel() -> some View {
        Label(.init("label"), systemImage: "swift")
    }
    
    @ViewBuilder
    private func getComposedLabel() -> some View {
        Label {
            Text(.init("body"))
                .font(.body)
                .foregroundStyle(.primary)
            Text(.init("subheadline"))
                .font(.subheadline)
                .foregroundStyle(.secondary)
        } icon: {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 44, height: 44, alignment: .center)
                .overlay {
                    Text(.init("body.initial"))
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
