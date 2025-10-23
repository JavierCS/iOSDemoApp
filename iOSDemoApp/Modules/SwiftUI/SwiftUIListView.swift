//
//  SwiftUIListView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 21/08/25.
//

import SwiftUI

struct SwiftUIListView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showNavigationSplitView: Bool = false
    @State private var showNavigationStack: Bool = false
    
    var body: some View {
        itemsList
            .navigationTitle("SwiftUI")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
            .sheet(isPresented: $showNavigationSplitView) {
                NavigationSplitViewDemoView()
            }
            .sheet(isPresented: $showNavigationStack) {
                NavigationStackDemoView()
            }
    }
    
    var itemsList: some View {
        List {
            Section("UI Elements") {
                NavigationLink {
                    ButtonDemoView()
                } label: {
                    Label("Button", systemImage: "capsule")
                }
                
                NavigationLink {
                    ColorPickerDemoView()
                } label: {
                    Label("Color Picker", systemImage: "paintpalette")
                }
                
                NavigationLink {
                    DatePickerDemoView()
                } label: {
                    Label("Date Picker", systemImage: "calendar")
                }
                
                NavigationLink {
                    DividerDemoView()
                } label: {
                    Label("Divider", systemImage: "square.grid.3x1.below.line.grid.1x2")
                }
                
                NavigationLink {
                    FormDemoView()
                } label: {
                    Label("Form", systemImage: "rectangle.and.pencil.and.ellipsis")
                }
                
                NavigationLink {
                    GridDemoView()
                } label: {
                    Label("Grid", systemImage: "square.grid.3x3")
                }
                
                NavigationLink {
                    GroupDemoView()
                } label: {
                    Label("Group", systemImage: "rectangle.3.group")
                }
                
                NavigationLink {
                    GroupBoxDemoView()
                } label: {
                    Label("Group Box", systemImage: "text.rectangle")
                }
                
                NavigationLink {
                    ImageDemoView()
                } label: {
                    Label("Image", systemImage: "photo")
                }
                
                NavigationLink {
                    LabelDemoView()
                } label: {
                    Label("Label", systemImage: "richtext.page")
                }
                
                NavigationLink {
                    LinkDemoView()
                } label: {
                    Label("Link", systemImage: "link")
                }
                
                NavigationLink {
                    ListDemoView()
                } label: {
                    Label("List", systemImage: "rectangle.grid.1x3")
                }
                
                NavigationLink {
                    MenuDemoView()
                } label: {
                    Label("Menu", systemImage: "filemenu.and.selection")
                }
                
                NavigationLink {
                    MultiDatePickerDemoView()
                } label: {
                    Label("Multi Date Picker", systemImage: "calendar")
                }
                
                HStack {
                    Label("Navigation Split View", systemImage: "sidebar.left")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    showNavigationSplitView.toggle()
                }
                
                HStack {
                    Label("Navigation Stack", systemImage: "chevron.forward")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    showNavigationStack.toggle()
                }
                
                NavigationLink {
                    PickerDemoView()
                } label: {
                    Label("Picker", systemImage: "rectangle.split.3x1")
                }
                
                NavigationLink {
                    ProgressViewDemoView()
                } label: {
                    Label("Progress View", systemImage: "progress.indicator")
                }
                
                NavigationLink {
                    ScrollViewDemoView()
                } label: {
                    Label("Scroll View", systemImage: "scroll")
                }
                
                NavigationLink {
                    ShapesDemoView()
                } label: {
                    Label("Shapes", systemImage: "triangleshape")
                }
                
                NavigationLink {
                    SliderDemoView()
                } label: {
                    Label("Slider", systemImage: "slider.horizontal.3")
                }
                
                NavigationLink {
                    SpacerDemoView()
                } label: {
                    Label("Spacer", systemImage: "space")
                }
                
                NavigationLink {
                    StacksDemoView()
                } label: {
                    Label("Stack View", systemImage: "square.stack.3d.up")
                }
                
                NavigationLink {
                    StepperDemoView()
                } label: {
                    Label("Stepper", systemImage: "shoeprints.fill")
                }
                
                NavigationLink {
                    TabViewDemoView()
                } label: {
                    Label("Tab View", systemImage: "platter.filled.bottom.iphone")
                }
                
                NavigationLink {
                    TextDemoView()
                } label: {
                    Label("Text", systemImage: "textformat")
                }
                
                NavigationLink {
                    TextFieldDemoView()
                } label: {
                    Label("Text Field", systemImage: "rectangle.and.pencil.and.ellipsis")
                }
                
                NavigationLink {
                    ToggleDemoView()
                } label: {
                    Label("Toggle", systemImage: "switch.2")
                }
                
                NavigationLink {
                    ViewThatFitsDemoView()
                } label: {
                    Label("View That Fits", systemImage: "arrow.up.left.and.arrow.down.right")
                }
                
                NavigationLink {
                    WebViewDemoView()
                } label: {
                    Label("Web View", systemImage: "network")
                }
            }
            
            Section("Modifiers") {
                NavigationLink {
                    GlassEffectDemoView()
                } label: {
                    Label("Glass Effect", systemImage: "slider.horizontal.below.circle.lefthalf.filled")
                }
                
                NavigationLink {
                    SearchableDemoView()
                } label: {
                    Label("Searchable", systemImage: "magnifyingglass")
                }
                
                NavigationLink {
                    SymbolEffectDemoView()
                } label: {
                    Label("Symbol Effect", systemImage: "xmark.triangle.circle.square")
                }
                
                NavigationLink {
                    ToolbarDemoView()
                } label: {
                    Label("Tool Bar", systemImage: "platter.filled.top.iphone")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SwiftUIListView()
    }
}
