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
            .navigationTitle("Picker")
    }
    
    var list: some View {
        List {
            Picker("Inline Picker Style", selection: $selectedItem) {
                ForEach(PickerItem.allCases, id: \.self) { item in
                    Text(item.rawValue)
                }
            }.pickerStyle(.inline)
            
            Section("Menu Picker Style") {
                Picker("Menu Picker Style", selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.menu)
                
                Picker("Menu Picker Style", selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                .pickerStyle(.menu)
                .tint(.pink)
            }
            
            Section("Navigation Link Picker") {
                Picker("Navigation Link Picker", selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.navigationLink)
                
                Picker("Navigation Link Picker", selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                .pickerStyle(.navigationLink)
                .tint(.pink)
            }
            
            Section("Palette Picker Style") {
                Picker("Palette Picker Style", selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.palette)
            }
            
            Section("Segmented Picker Style") {
                Picker("Segmented Picker Style", selection: $selectedItem) {
                    ForEach(PickerItem.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }.pickerStyle(.segmented)
            }
            
            Section("Wheel Picker Style") {
                Picker("Wheel Picker Style", selection: $selectedItem) {
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
