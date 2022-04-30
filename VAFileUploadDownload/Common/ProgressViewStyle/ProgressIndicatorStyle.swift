//
//  ProgressIndicatorStyle.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 29/04/22.
//

import Foundation

enum ProgressIndicatorStyle {
    
    case linear
    case circular
    case withBackground
    case roundRect
    case customCircular
    
    var text: String {
        switch self {
        case .linear:
            return "Linear"
        case .circular:
            return "Circular"
        case .withBackground:
            return "Progress view with background"
        case .roundRect:
            return "Linear with rounded corners"
        case .customCircular:
            return "Dotted circular progress view"
        }
    }
    
    init?(with text: String) {
        switch text {
        case "Linear":
            self = .linear
        case "Circular":
            self = .circular
        case "Progress view with background":
            self = .withBackground
        case "Linear with rounded corners":
            self = .roundRect
        case "Dotted circular progress view":
            self = .customCircular
        default:
            self = .linear
        }
    }
}
