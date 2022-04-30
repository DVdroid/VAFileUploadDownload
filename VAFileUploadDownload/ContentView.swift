//
//  ContentView.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 25/04/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var settingViewModel = SettingViewModel()
    
    var body: some View {
        
        TabView {
            UploadView()
                .tabItem {
                    Image(systemName: "arrow.up.doc")
                    Text("Upload")
                }
            
            DownloadView()
                .tabItem {
                    Image(systemName: "arrow.down.doc")
                    Text("Download")
                }
            
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Setting")
                }
        }
        .environmentObject(settingViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
