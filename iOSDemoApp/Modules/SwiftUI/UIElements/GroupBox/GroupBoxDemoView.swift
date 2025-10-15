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
