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
    LabelDemoView()
}

struct LeadingIconLabelStyle: LabelStyle {
    let spacing: CGFloat
    
    init(spacing: CGFloat = 16) {
        self.spacing = spacing
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: spacing) {
            configuration.icon
                .foregroundStyle(Color.accentColor)
            configuration.title
        }
    }
}

struct TopIconLabelStyle: LabelStyle {
    let spacing: CGFloat?
    
    init(spacing: CGFloat? = nil) {
        self.spacing = spacing
    }
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: spacing) {
            configuration.icon
                .foregroundStyle(Color.accentColor)
            configuration.title
        }
    }
}

struct BottomIconLabelStyle: LabelStyle {
    let spacing: CGFloat?
    
    init(spacing: CGFloat? = nil) {
        self.spacing = spacing
    }
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: spacing) {
            configuration.title
            configuration.icon
                .foregroundStyle(Color.accentColor)
        }
    }
}

struct RedBorderedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .border(.red)
    }
}
