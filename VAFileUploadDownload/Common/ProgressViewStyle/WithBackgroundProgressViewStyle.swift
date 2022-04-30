//
//  WithBackgroundProgressViewStyle.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 30/04/22.
//

import SwiftUI

struct WithBackgroundProgressViewStyle: ProgressViewStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .padding(8)
            .background(Color.gray.opacity(0.25))
            .accentColor(.red)
            .cornerRadius(8)
    }
}
