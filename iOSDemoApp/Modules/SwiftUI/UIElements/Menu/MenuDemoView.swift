//
//  MenuDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

struct MenuDemoView: View {
    
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
    
    var body: some View {
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
        .navigationTitle(.init("menu"))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                complexMenu
            }
            
            ToolbarItem(placement: .title) {
                complexMenu
            }
        }
//        .sheet(isPresented: .constant(true)) {
//            Form {
//                Menu("actions") {
//                    Button(.init("duplicate"), action: {})
//                    Button(.init("rename"), action: {})
//                    Button(.init("delete"), action: {})
//                    Menu(.init("copy")) {
//                        Button(.init("copy"), action: {})
//                        Button(.init("copyFormatted"), action: {})
//                        Button(.init("copyLibraryPath"), action: {})
//                    }
//                }
//            }
//        }
    }
}

#Preview {
    NavigationStack {
        MenuDemoView()
    }
}

struct CapsuleMenuStyle: MenuStyle {
    var fill: Color = .blue.opacity(0.12)
    var border: Color = .secondary.opacity(0.25)
    var paddingV: CGFloat = 10
    var paddingH: CGFloat = 14

    func makeBody(configuration: Configuration) -> some View {
        Menu(configuration)                // 🔑 mantiene el contenido del menú
            .menuIndicator(.hidden)        // ocultar chevron nativo si quieres
            .buttonStyle(.plain)           // evita estilos de botón heredados
            .padding(.vertical, paddingV)
            .padding(.horizontal, paddingH)
            .background(fill, in: Capsule())
            .overlay(Capsule().stroke(border))
    }
}
