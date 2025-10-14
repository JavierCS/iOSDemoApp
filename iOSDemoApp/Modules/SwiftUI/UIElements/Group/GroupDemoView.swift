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
            Section(.init("multiViewsModifiers")) {
                Group {
                    Text(.init("title"))
                    Text(.init("subTitle"))
                }
                .font(.headline)
                .foregroundStyle(.blue)
            }
            
            Section {
                conditionalContent
            } header: {
                Text(.init("bodyConditionals"))
            } footer: {
                Toggle(isOn: $isLoggedIn) {
                    Label(.init("isLoggedIn"), systemImage: "apple.logo")
                }
            }
            
            Section(.init("logicSeparation")) {
                VStack {
                    Group {
                        Text(.init("personalData"))
                        TextField(.init("name"), text: $name)
                        TextField(.init("email"), text: $email)
                    }
                    
                    Divider()
                    
                    Group {
                        Text(.init("configuration"))
                        Toggle(.init("darkMode"), isOn: $darkMode)
                        Toggle(.init("notifications"), isOn: $notifications)
                    }
                }
            }

        }.navigationTitle(.init("group"))
    }
    
    var conditionalContent: some View {
        if isLoggedIn {
            Group {
                Text(.init("isLoggedIn"))
                Text(Date(), format: .dateTime)
            }
        } else {
            Group {
                Text(.init("isNotLoggedIn"))
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
