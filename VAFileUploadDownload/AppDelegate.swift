//
//  AppDelegate.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 25/04/22.
//

import OSLog
import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    var backgroundCompletionHandler: (() -> Void)?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(#function)
        return true
    }
    
    func application(_: UIApplication,
                     handleEventsForBackgroundURLSession identifier: String,
                     completionHandler: @escaping () -> Void) {
        backgroundCompletionHandler = completionHandler
        os_log("handleEventsForBackgroundURLSession for %@", type: .info, identifier)
    }
}

