//
//  MenuDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

struct MenuDemoView: View {
    @State private var showForm: Bool = false
    
    var complexMenu: some View {
        Menu("Actions") {
            Button("Duplicate", action: {})
            Button("Rename", action: {})
            Button("Delete", action: {})
            Menu("Copy") {
                Button("Copy", action: {})
                Button("Copy Formatted", action: {})
                Button("Copy Library Path", action: {})
            }
        }
    }
    
    var list: some View {
        List {
            Section("Initialization") {
                complexMenu
                
                Menu {
                    Button("Open in preview", action: {})
                    Button("Save as pdf", action: {})
                } label: {
                    Label("PDF", systemImage: "doc")
                }
                
                Menu {
                    Button(action: {}) {
                        // The subtitle behavior does not apply to buttons outside of a menu's content.
                        Text("Open in preview")
                        Text("openInPreviewDescription")
                    }
                    Button(action: {}) {
                        Text("Save as pdf")
                        Text("Save as pdf description")
                    }
                } label: {
                    Label("PDF", systemImage: "doc")
                }
            }
            
            Section("Primary Action") {
                Menu {
                    Button(action: {}) {
                        Label("Add to reading list", systemImage: "eyeglasses")
                    }
                    Button(action: {}) {
                        Label("Add bookmarks for all tabs", systemImage: "book")
                    }
                    Button(action: {}) {
                        Label("Show all bookmarks", systemImage: "books.vertical")
                    }
                } label: {
                    Label("Tap or press and hold", systemImage: "book")
                } primaryAction: {
                    print("primaryAction")
                }
                
                Button {
                    
                } label: {
                    Label("Apple Developer Documentation", systemImage: "apple.logo")
                }
                .contextMenu {
                    complexMenu
                }
            }
            
            Section("Custom Styles") {
                Menu("Editing") {
                    Button("Set in point", action: {})
                    Divider()
                    Button("Set out ponint", action: {})
                }
                .menuStyle(CapsuleMenuStyle())
            }
        }
    }
    
    var body: some View {
        VStack {
            list
            Button("Show Form") {
                showForm.toggle()
            }
        }
        .navigationTitle("Menu")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                complexMenu
            }
            
            ToolbarItem(placement: .title) {
                complexMenu
            }
        }
        .sheet(isPresented: $showForm) {
            Form {
                Menu("Actions") {
                    Button("Duplicate", action: {})
                    Button("Rename", action: {})
                    Button("Delete", action: {})
                    Menu("Copy") {
                        Button("Copy", action: {})
                        Button("Copy formatted", action: {})
                        Button("Copy library path", action: {})
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MenuDemoView()
    }
}
