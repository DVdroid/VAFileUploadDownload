//
//  SettingRowItem.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 30/04/22.
//

import Foundation

struct SettingRowItem: Identifiable {
    let id = UUID()
    let indexPath: IndexPath
    let text: String
    var isSelected: Bool
}
