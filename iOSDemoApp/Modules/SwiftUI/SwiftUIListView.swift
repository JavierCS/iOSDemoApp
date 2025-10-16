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
            .navigationTitle(Text(.init("swiftui")))
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
            Section(.init("uiElements")) {
                NavigationLink {
                    ButtonDemoView()
                } label: {
                    Label(.init("button"), systemImage: "capsule")
                }
                
                NavigationLink {
                    DatePickerDemoView()
                } label: {
                    Label(.init("datePicker"), systemImage: "calendar")
                }
                
                NavigationLink {
                    DividerDemoView()
                } label: {
                    Label(.init("divider"), systemImage: "square.grid.3x1.below.line.grid.1x2")
                }
                
                NavigationLink {
                    FormDemoView()
                } label: {
                    Label(.init("form"), systemImage: "rectangle.and.pencil.and.ellipsis")
                }
                
                NavigationLink {
                    GridDemoView()
                } label: {
                    Label(.init("grid"), systemImage: "square.grid.3x3")
                }
                
                NavigationLink {
                    GroupDemoView()
                } label: {
                    Label(.init("group"), systemImage: "rectangle.3.group")
                }
                
                NavigationLink {
                    GroupBoxDemoView()
                } label: {
                    Label(.init("groupBox"), systemImage: "text.rectangle")
                }
                
                NavigationLink {
                    ImageDemoView()
                } label: {
                    Label(.init("image"), systemImage: "photo")
                }
                
                NavigationLink {
                    LabelDemoView()
                } label: {
                    Label(.init("label"), systemImage: "richtext.page")
                }
                
                NavigationLink {
                    LinkDemoView()
                } label: {
                    Label("link", systemImage: "link")
                }
                
                NavigationLink {
                    ListDemoView()
                } label: {
                    Label(.init("list"), systemImage: "rectangle.grid.1x3")
                }
                
                NavigationLink {
                    MenuDemoView()
                } label: {
                    Label(.init("menu"), systemImage: "filemenu.and.selection")
                }
                
                NavigationLink {
                    MultiDatePickerDemoView()
                } label: {
                    Label(.init("multiDatePicker"), systemImage: "calendar")
                }
                
                HStack {
                    Label(.init("navigationSplitView"), systemImage: "sidebar.left")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    showNavigationSplitView.toggle()
                }
                
                HStack {
                    Label(.init("navigationStack"), systemImage: "chevron.forward")
                    Spacer()
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    showNavigationStack.toggle()
                }
                
                NavigationLink {
                    PickerDemoView()
                } label: {
                    Label(.init("picker"), systemImage: "rectangle.split.3x1")
                }
                
                NavigationLink {
                    ProgressViewDemoView()
                } label: {
                    Label(.init("progressView"), systemImage: "progress.indicator")
                }
                
                NavigationLink {
                    ScrollViewDemoView()
                } label: {
                    Label(.init("scrollView"), systemImage: "scroll")
                }
                
                NavigationLink {
                    ShapesDemoView()
                } label: {
                    Label(.init("shapes"), systemImage: "triangleshape")
                }
                
                NavigationLink {
                    SliderDemoView()
                } label: {
                    Label(.init("slider"), systemImage: "slider.horizontal.3")
                }
                
                NavigationLink {
                    SpacerDemoView()
                } label: {
                    Label(.init("spacer"), systemImage: "space")
                }
                
                NavigationLink {
                    StacksDemoView()
                } label: {
                    Label(.init("stackViews"), systemImage: "square.stack.3d.up")
                }
                
                NavigationLink {
                    StepperDemoView()
                } label: {
                    Label(.init("stepper"), systemImage: "shoeprints.fill")
                }
                
                NavigationLink {
                    TabViewDemoView()
                } label: {
                    Label(.init("tabView"), systemImage: "platter.filled.bottom.iphone")
                }
                
                NavigationLink {
                    TextDemoView()
                } label: {
                    Label(.init("text"), systemImage: "textformat")
                }
                
                NavigationLink {
                    TextFieldDemoView()
                } label: {
                    Label(.init("textField"), systemImage: "rectangle.and.pencil.and.ellipsis")
                }
                
                NavigationLink {
                    ToggleDemoView()
                } label: {
                    Label(.init("toggle"), systemImage: "switch.2")
                }
                
                NavigationLink {
                    ViewThatFitsDemoView()
                } label: {
                    Label(.init("viewThatFits"), systemImage: "arrow.up.left.and.arrow.down.right")
                }
                
                NavigationLink {
                    WebViewDemoView()
                } label: {
                    Label(.init("webView"), systemImage: "network")
                }
            }
            
            Section(.init("Modifiers")) {
                NavigationLink {
                    GlassEffectDemoView()
                } label: {
                    Label(.init("glassEffect"), systemImage: "slider.horizontal.below.circle.lefthalf.filled")
                }
                
                NavigationLink {
                    SearchableDemoView()
                } label: {
                    Label(.init("searchable"), systemImage: "magnifyingglass")
                }
                
                NavigationLink {
                    ToolbarDemoView()
                } label: {
                    Label(.init("toolBar"), systemImage: "platter.filled.top.iphone")
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
