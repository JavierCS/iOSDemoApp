//
//  GroupDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

struct GroupDemoView: View {
    @State private var isLoggedIn: Bool = false
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var darkMode: Bool = false
    @State private var notifications: Bool = false
    
    var body: some View {
        List {
            Section("Multi Views Modifiers") {
                Group {
                    Text("Title")
                    Text("Sub Title")
                }
                .font(.headline)
                .foregroundStyle(.blue)
            }
            
            Section {
                conditionalContent
            } header: {
                Text("Body Conditionals")
            } footer: {
                Toggle(isOn: $isLoggedIn) {
                    Label("Is logged in", systemImage: "apple.logo")
                }
            }
            
            Section("Logic Separation") {
                VStack {
                    Group {
                        Text("Personal Data")
                        TextField("Name", text: $name)
                        TextField("Email", text: $email)
                    }
                    
                    Divider()
                    
                    Group {
                        Text("Configuration")
                        Toggle("Dark Mode", isOn: $darkMode)
                        Toggle("Notifications", isOn: $notifications)
                    }
                }
            }

        }.navigationTitle("Group")
    }
    
    var conditionalContent: some View {
        if isLoggedIn {
            Group {
                Text("Is logged in")
                Text(Date(), format: .dateTime)
            }
        } else {
            Group {
                Text("Is not logged in")
                Text(Date(), format: .dateTime)
            }
        }
    }
}

#Preview {
    NavigationStack {
        GroupDemoView()
    }
}
