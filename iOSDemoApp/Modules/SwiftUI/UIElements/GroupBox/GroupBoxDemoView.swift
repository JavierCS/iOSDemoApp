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
            Section("Default") {
                getGroupBox()
            }
            
            Section("Custom Style") {
                getGroupBox()
                    .groupBoxStyle(CardGroupBoxStyle())
                
                getGroupBox()
                    .groupBoxStyle(CardGroupBoxStyle(showLabel: false))
                
            }
        }
        .listStyle(.grouped)
        .navigationTitle("Group Box")
    }
    
    @ViewBuilder
    private func getGroupBox() -> some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Some Content")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        } label: {
            VStack {
                HStack {
                    Text("Title")
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
