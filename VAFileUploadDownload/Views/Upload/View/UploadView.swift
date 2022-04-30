//
//  UploadView.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 30/04/22.
//

import SwiftUI

struct UploadView: View {
    
    @ObservedObject var uploadViewModel = UploadViewModel()
    @State private var progressValue: Double = 0
    @EnvironmentObject var settingViewModel: SettingViewModel
    
    private var selectedProgressViewStyle: ProgressIndicatorStyle {
        settingViewModel.selectedProgressViewStyle
    }
    
    var body: some View {
        VStack {
            Spacer()
                .frame(width: UIScreen.main.bounds.width, height: 50,
                       alignment: .center)
            
            Button("Start Upload") {
                uploadViewModel.startUpload()
            }
        }
        .progressView(for: selectedProgressViewStyle, progressValue: $progressValue)
        .onReceive(uploadViewModel.$progressValue) { self.progressValue = $0 }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
