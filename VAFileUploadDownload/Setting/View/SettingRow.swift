//
//  SettingRow.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 29/04/22.
//

import SwiftUI

struct SettingRow: View {
    
    var rowItem: SettingRowItem
    var tapActionCallBack: ((IndexPath) -> Void)? = nil
    
    init(rowItem: SettingRowItem, _ tapActionCallBack: ((IndexPath) -> Void)? = nil) {
        self.rowItem = rowItem
        self.tapActionCallBack = tapActionCallBack
    }
    
    var body: some View {
        HStack {
            Text(rowItem.text)
            Spacer()
            if rowItem.isSelected {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            tapActionCallBack?(rowItem.indexPath)
        }
    }
}

struct SettingRow_Previews: PreviewProvider {
    static var previews: some View {
        SettingRow(rowItem:.init(indexPath: .init(row: 0, section: 0),
                         text: "Linear",
                         isSelected: true)
        )
    }
}
