//
//  PickerDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

enum PickerItem: String, CaseIterable, Identifiable {
    case itemOne = "Item One"
    case itemTwo = "Item Two"
    case itemThree = "Item Three"
    
    var id: Self { self }
}

struct PickerDemoView: View {
    @State private var selectedItem: PickerItem = .itemOne
    
    var body: some View {
        list
            .navigationTitle(Text(.init("picker")))
    }
    
    var list: some View {
        List {
            Picker(.init("inlinePickerStyle"), selection: $selectedItem) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.inline)
            
            Section(.init("menuPickerStyle")) {
                Picker(.init("menuPickerStyle"), selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.menu)
                
                Picker(.init("menuPickerStyle"), selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                .pickerStyle(.menu)
                .tint(.pink)
            }
            
            Section(.init("navigationLinkPicker")) {
                Picker(.init("navigationLinkPicker"), selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.navigationLink)
                
                Picker(.init("navigationLinkPicker"), selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                .pickerStyle(.navigationLink)
                .tint(.pink)
            }
            
            Section(.init("palettePickerStyle")) {
                Picker(.init("palettePickerStyle"), selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.palette)
            }
            
//            Picker(.init("picker"), selection: $selectedItem) {
//                ForEach(PickerItem.allCases, id: \.self) { item in
//                    Text(item.rawValue)
//                }
//            }.pickerStyle(.radioGroup)
            
            Section(.init("segmentedPickerStyle")) {
                Picker(.init("segmentedPickerStyle"), selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.segmented)
            }
            
            Section(.init("wheelPickerStyle")) {
                Picker(.init("wheelPickerStyle"), selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.wheel)
            }
        }
    }
}

#Preview {
    NavigationStack {
        PickerDemoView()
    }
}
