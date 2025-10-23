//
//  FormDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

enum NotifyMeAboutType: String, CaseIterable {
    case directMessages = "Direct Message"
    case mentions = "Mentions"
    case anything = "Anything"
}

enum ProfileImageSize: String, CaseIterable {
    case large
    case medium
    case small
    
    func localizedText() -> String {
        NSLocalizedString(rawValue, comment: .empty)
    }
}

struct FormDemoView: View {
    @State private var notifyMeAbout: NotifyMeAboutType = .directMessages
    @State private var playNotificationSounds: Bool = true
    @State private var sendRedReceipts: Bool = true
    @State private var profileImageSize: ProfileImageSize = .large
    
    var body: some View {
        Form {
            Section("Notifications") {
                Picker("Notify me about", selection: $notifyMeAbout) {
                    ForEach(NotifyMeAboutType.allCases, id: \.self) { caseType in
                        Text(caseType.rawValue).tag(caseType)
                    }
                }
                Toggle("Play notification sounds", isOn: $playNotificationSounds)
                Toggle("Send read receipts", isOn: $sendRedReceipts)
            }
            
            Section("User Profiles") {
                Picker("Profile image size", selection: $profileImageSize) {
                    ForEach(ProfileImageSize.allCases, id: \.self) { imageSize in
                        Text(imageSize.localizedText()).tag(imageSize)
                    }
                }
                Button("Clear image cache") {}
            }
        }
//        .formStyle(.columns) this is for macOS
        .navigationTitle("Form")
    }
}

#Preview {
    NavigationStack {
        FormDemoView()
    }
}
