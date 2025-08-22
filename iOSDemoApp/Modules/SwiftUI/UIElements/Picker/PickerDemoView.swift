//
//  PickerDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 18/08/25.
//

import SwiftUI

enum PickerItem: String, CaseIterable {
    case itemOne = "Item One"
    case itemTwo = "Item Two"
    case itemThree = "Item Three"
}

struct PickerDemoView: View {
    @State private var selectedItem: PickerItem = .itemOne
    
    var body: some View {
        list
    }
    
    var list: some View {
        List {
            Picker(.init("automaticPickerStyle"), selection: $selectedItem) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.automatic)
            
            Picker(.init("inlinePickerStyle"), selection: $selectedItem) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.inline)
            
            Picker(.init("menuPickerStyle"), selection: $selectedItem) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.menu)
            
            Picker(.init("navigationLinkPicker"), selection: $selectedItem) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.navigationLink)
            
            Picker(.init("palettePickerStyle"), selection: $selectedItem) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.palette)
            
//            Picker(.init("picker"), selection: $selectedItem) {
//                ForEach(PickerItem.allCases, id: \.self) { item in
//                    Text(item.rawValue)
//                }
//            }.pickerStyle(.radioGroup)
            
            Picker(.init("segmentedPickerStyle"), selection: $selectedItem) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.segmented)
            
            Picker(.init("wheelPickerStyle"), selection: $selectedItem) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.wheel)
        }
    }
}

#Preview {
    NavigationStack {
        PickerDemoView()
    }
}
