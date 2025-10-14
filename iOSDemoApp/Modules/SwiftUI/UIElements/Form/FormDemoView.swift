//
//  FormDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

enum NotifyMeAboutType: String, CaseIterable {
    case directMessages
    case mentions
    case anything
    
    func localizedText() -> String {
        NSLocalizedString(rawValue, comment: .empty)
    }
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
            Section(.init("notifications")) {
                Picker(.init("notifyMeAbout"), selection: $notifyMeAbout) {
                    ForEach(NotifyMeAboutType.allCases, id: \.self) { caseType in
                        Text(caseType.localizedText()).tag(caseType)
                    }
                }
                Toggle(.init("playNotificationSounds"), isOn: $playNotificationSounds)
                Toggle(.init("sendReadReceipts"), isOn: $sendRedReceipts)
            }
            
            Section(.init("userProfiles")) {
                Picker(.init("profileImageSize"), selection: $profileImageSize) {
                    ForEach(ProfileImageSize.allCases, id: \.self) { imageSize in
                        Text(imageSize.localizedText()).tag(imageSize)
                    }
                }
                Button(.init("clearImageCache")) {}
            }
        }
//        .formStyle(.columns) this is for macOS
        .navigationTitle(.init("form"))
    }
}

#Preview {
    NavigationStack {
        FormDemoView()
    }
}
