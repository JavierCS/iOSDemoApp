//
//  ToolbarDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 11/08/25.
//

import SwiftUI

struct ToolbarDemoView: View {
    @State private var pickerItem: PickerItem = .itemOne
    
    var body: some View {
        toolbarDemo
            .navigationTitle("Toolbar")
            .toolbar {
                ToolbarItemGroup(placement: .primaryAction) {
                    Button { } label: { Image(systemName: "chevron.up") }
                    Button { } label: { Image(systemName: "chevron.down") }
                }
                
                ToolbarSpacer(.fixed, placement: .primaryAction)
                
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Picker(String.empty, selection: $pickerItem) {
                            ForEach(PickerItem.allCases) { item in
                                Text(item.rawValue).tag(item)
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
                
                ToolbarSpacer(.flexible, placement: .bottomBar)
                
                ToolbarItem(placement: .bottomBar) {
                    Button { /*Done Action*/ } label: {
                        Label("done", systemImage: "checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.pink)
                }
            }
    }
    
    var toolbarDemo: some View {
        Color(uiColor: .systemGroupedBackground)
            .ignoresSafeArea()
    }
}

#Preview {
    NavigationStack {
        ToolbarDemoView()
    }
}
