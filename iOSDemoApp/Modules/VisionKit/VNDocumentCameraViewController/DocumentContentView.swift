//
//  DocumentContentView.swift
//  iOSDemoApp
//
//  Created by Javier Cruz Santiago on 26/08/25.
//

import SwiftUI

struct DocumentContentView: View {
    var content: (image: UIImage, result: DocumentTextResult)
    
    var body: some View {
        list
    }
    
    var list: some View {
        List {
            Section(.init("image")) {
                HStack {
                    Spacer()
                    Image(uiImage: content.image)
                    Spacer()
                }
            }
            
            Section(.init("fullText")) {
                Text(content.result.fullText)
            }
            
            Section(.init("lines")) {
                ForEach(content.result.lines, id: \.self) { line in
                    Text(line)
                }
            }
        }
    }
}

#Preview {
    DocumentContentView(
        content: (UIImage(systemName: "swift")!, DocumentTextResult(
            fullText: "Full Text",
            lines: [
                "Line One",
                "Line Two",
                "Line Three"
            ],
            rawObservations: []
        ))
    )
}
