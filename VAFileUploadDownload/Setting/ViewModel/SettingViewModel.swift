//
//  SettingViewModel.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 30/04/22.
//

import Foundation

final class SettingViewModel: NSObject, ObservableObject {
    
    @Published var rowItems: [SettingRowItem] = []
    
    var selectedProgressViewStyle: ProgressIndicatorStyle {
        guard let selectedItem = rowItems.filter({ $0.isSelected }).first else {
            return .linear
        }
        return ProgressIndicatorStyle(with: selectedItem.text) ?? .linear
    }
    
    override init() {
        self.rowItems = [
            SettingRowItem(indexPath: IndexPath(row: 0, section: 0), text: ProgressIndicatorStyle.linear.text, isSelected: true),
            SettingRowItem(indexPath: IndexPath(row: 0, section: 1), text: ProgressIndicatorStyle.circular.text, isSelected: false),
            SettingRowItem(indexPath: IndexPath(row: 0, section: 2), text: ProgressIndicatorStyle.withBackground.text, isSelected: false),
            SettingRowItem(indexPath: IndexPath(row: 0, section: 3), text: ProgressIndicatorStyle.roundRect.text, isSelected: false),
            SettingRowItem(indexPath: IndexPath(row: 0, section: 4), text: ProgressIndicatorStyle.customCircular.text, isSelected: false)
        ]
    }
    
    func updateSelectionState(for indexPath: IndexPath) {
        self.rowItems = rowItems.map {
            var mutableRowItem = $0
            mutableRowItem.isSelected = mutableRowItem.indexPath == indexPath ? true : false
            return mutableRowItem
        }
    }
}
