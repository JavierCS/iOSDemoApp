//
//  CustomProgressViewStyle.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 19/10/25.
//

import SwiftUI

struct CustomProgressViewStyle: ProgressViewStyle {
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(.green)
                .frame(height: 20.0)
            if #available(iOS 15.0, *) {
                ProgressView(configuration)
                    .tint(.blue)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            } else {
                ProgressView(configuration)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            }
        }
    }
}
