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
        Menu("actions") {
            Button(.init("duplicate"), action: {})
            Button(.init("rename"), action: {})
            Button(.init("delete"), action: {})
            Menu(.init("copy")) {
                Button(.init("copy"), action: {})
                Button(.init("copyFormatted"), action: {})
                Button(.init("copyLibraryPath"), action: {})
            }
        }
    }
    
    var list: some View {
        List {
            Section(.init("initialization")) {
                complexMenu
                
                Menu {
                    Button(.init("openInPreview"), action: {})
                    Button(.init("saveAsPdf"), action: {})
                } label: {
                    Label(.init("pdf"), systemImage: "doc")
                }
                
                Menu {
                    Button(action: {}) {
                        // The subtitle behavior does not apply to buttons outside of a menu's content.
                        Text(.init("openInPreview"))
                        Text(.init("openInPreviewDescription"))
                    }
                    Button(action: {}) {
                        Text(.init("saveAsPdf"))
                        Text(.init("saveAsPdfDescription"))
                    }
                } label: {
                    Label(.init("pdf"), systemImage: "doc")
                }
            }
            
            Section(.init("primaryAction")) {
                Menu {
                    Button(action: {}) {
                        Label(.init("addToReadingList"), systemImage: "eyeglasses")
                    }
                    Button(action: {}) {
                        Label(.init("addBookmarksForAllTabs"), systemImage: "book")
                    }
                    Button(action: {}) {
                        Label(.init("showAllBookmarks"), systemImage: "books.vertical")
                    }
                } label: {
                    Label(.init("tapOrPressAndHold"), systemImage: "book")
                } primaryAction: {
                    print("primaryAction")
                }
                
                Button {
                    
                } label: {
                    Label(.init("appleDeveloperDocumentation"), systemImage: "apple.logo")
                }
                .contextMenu {
                    complexMenu
                }
            }
            
            Section(.init("customStyles")) {
                Menu(.init("editing")) {
                    Button(.init("setInPoint"), action: {})
                    Divider()
                    Button(.init("setOutPonint"), action: {})
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
        .navigationTitle(.init("menu"))
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
                Menu("actions") {
                    Button(.init("duplicate"), action: {})
                    Button(.init("rename"), action: {})
                    Button(.init("delete"), action: {})
                    Menu(.init("copy")) {
                        Button(.init("copy"), action: {})
                        Button(.init("copyFormatted"), action: {})
                        Button(.init("copyLibraryPath"), action: {})
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

