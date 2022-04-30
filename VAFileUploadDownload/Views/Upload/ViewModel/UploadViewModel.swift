//
//  UploadViewModel.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 27/04/22.
//

import Foundation
import Combine

final class UploadViewModel: NSObject, ObservableObject {
    
    @Published var progressValue: Double = 0
    private var cancellables = Set<AnyCancellable>()
    
    private var publisher: FileUploader.Publisher {
        let fileUploader = FileUploader()
        let uploadFilePathURL = getFilePathURL()!
        var uploadLink = URL(string: "https://www.filestackapi.com/api/store/S3")!
        uploadLink.appendQueryItem(name: "key", value: "AaVGIDtisQTqxZwvSTMncz")
        return fileUploader.uploadFile(at: uploadFilePathURL, to: uploadLink)
    }
    
    private func getFilePathURL() -> URL? {
        guard let bundleFileUrl = Bundle.main.url(forResource: "out",
                                                  withExtension: "txt") else { return nil }
        guard let filePathURL = moveToTemporaryDirectory(from: bundleFileUrl)
        else { return nil }
        return filePathURL
    }
    
    private func moveToTemporaryDirectory(from location: URL) -> URL? {
        
        var savedURL: URL?
        do {
            let temporaryDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory(),
                                                isDirectory: true)
            savedURL = temporaryDirectoryURL.appendingPathComponent(location.lastPathComponent)
            if FileManager.default.fileExists(atPath: (savedURL?.path)!) {
                try FileManager.default.removeItem(atPath: (savedURL?.path)!)
            }
            try FileManager.default.copyItem(at: location, to: savedURL!)
        } catch {
            print(error.localizedDescription)
        }
        return savedURL
    }
    
    func startUpload() {
        publisher
            .receive(on: OperationQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { self.progressValue = $0 })
            .store(in: &cancellables)
    }
}
