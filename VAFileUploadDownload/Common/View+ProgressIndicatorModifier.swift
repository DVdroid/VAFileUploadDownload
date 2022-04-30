//
//  View+ProgressIndicatorModifier.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 30/04/22.
//

import SwiftUI

extension View {
    func progressView(for progressIndicatorStyle: ProgressIndicatorStyle, progressValue: Binding<Double>) -> some View {
        modifier(CustomProgressView(progressIndicatorStyle: progressIndicatorStyle, progressValue: progressValue))
    }
}
