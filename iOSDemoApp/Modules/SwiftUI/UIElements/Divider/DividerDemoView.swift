//
//  DividerDemoView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 13/10/25.
//

import SwiftUI

struct DividerDemoView: View {
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(.init("textOne"))
                Divider()
                
                Text(.init("textTwo"))
                    .frame(maxWidth: .infinity)
                Divider()
                
                Text(.init("textThree"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Image(systemName: "apple.logo")
                        .frame(maxWidth: .infinity)
                    Divider()
                    
                    Image(systemName: "apple.logo")
                        .frame(maxWidth: .infinity)
                    Divider()
                    
                    Image(systemName: "apple.logo")
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationTitle(.init("divider"))
    }
}

#Preview {
    NavigationStack {
        DividerDemoView()
    }
}
