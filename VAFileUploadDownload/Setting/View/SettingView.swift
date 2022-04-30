//
//  SettingView.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 30/04/22.
//

import SwiftUI

struct SettingView: View {
    
    //@ObservedObject var viewModel: SettingViewModel
    @EnvironmentObject var settingViewModel: SettingViewModel
    
    var body: some View {
        VStack {
            List {
                Section(
                    header: Text("Progress Indicator styles")
                        .font(.subheadline)
                ) {
                    ForEach(settingViewModel.rowItems) { rowItem in
                        SettingRow(rowItem: rowItem) { indexPath in
                            settingViewModel.updateSelectionState(for: indexPath)
                        }
                    }
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
