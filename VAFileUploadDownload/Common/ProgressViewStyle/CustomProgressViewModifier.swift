//
//  CustomProgressViewModifier.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 30/04/22.
//

import SwiftUI

struct CustomProgressView: ViewModifier {
    
    var progressIndicatorStyle: ProgressIndicatorStyle
    @Binding var progressValue: Double
    
    func body(content: Content) -> some View {
        switch progressIndicatorStyle {
        case .linear:
            ProgressView(value: progressValue, total: 100)
                .accentColor(.gray)
                .foregroundColor(.blue)
                .padding(.horizontal, 64)
        case .circular:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .purple))
        case .roundRect:
            ProgressView(value: progressValue, total: 100)
                .progressViewStyle(RoundedRectProgressViewStyle())
        case .withBackground:
            ProgressView(value: progressValue, total: 100)
                .progressViewStyle(WithBackgroundProgressViewStyle())
                .padding(.horizontal, 64)
        case .customCircular:
            ProgressView(value: progressValue, total: 100)
                .progressViewStyle(CustomCircularProgressViewStyle())
        }
    }
}
