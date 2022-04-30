//
//  DownloadView.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 30/04/22.
//

import SwiftUI

struct DownloadView: View {
    
    @ObservedObject var uploadViewModel = UploadViewModel()
    @State private var progressValue: Double = 0
    @EnvironmentObject var settingViewModel: SettingViewModel
    
    private var selectedProgressViewStyle: ProgressIndicatorStyle {
        settingViewModel.selectedProgressViewStyle
    }
    
    var body: some View {
        VStack {
            Spacer()
                .frame(width: UIScreen.main.bounds.width,
                       height: 50,
                       alignment: .center)
            
            Button("Start Download") {
                uploadViewModel.startUpload()
            }
        }
        .progressView(for: selectedProgressViewStyle, progressValue: $progressValue)
    }
}

struct DownloadView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadView()
    }
}



