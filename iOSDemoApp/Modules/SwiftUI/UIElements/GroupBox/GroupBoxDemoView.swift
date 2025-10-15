//
//  GroupBoxDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 15/10/25.
//

import SwiftUI

struct GroupBoxDemoView: View {
    var body: some View {
        List {
            Section(.init("default")) {
                getGroupBox()
            }
            
            Section(.init("customStyle")) {
                getGroupBox()
                    .groupBoxStyle(CardGroupBoxStyle())
                
                getGroupBox()
                    .groupBoxStyle(CardGroupBoxStyle(showLabel: false))
                
            }
        }
        .listStyle(.grouped)
        .navigationTitle(.init("groupBox"))
    }
    
    @ViewBuilder
    private func getGroupBox() -> some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text(.init("someContent"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } label: {
            VStack {
                HStack {
                    Text(.init("title"))
                    Spacer()
                    Image(systemName: "apple.logo")
                }
                Divider()
            }
        }
    }
}

#Preview {
    NavigationStack {
        GroupBoxDemoView()
    }
}


struct CardGroupBoxStyle: GroupBoxStyle {
    let showLabel: Bool
    
    init(showLabel: Bool = true) {
        self.showLabel = showLabel
    }
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            if showLabel {
                configuration.label
                    .font(.headline)
            }
            configuration.content
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.white)
                .shadow(radius: 5)
        }
    }
}
