//
//  FileUploader.swift
//  VAFileUploadDownload
//
//  Created by Vikash Anand on 26/04/22.
//

import Foundation
import Combine

final class FileUploader: NSObject {
    typealias Percentage = Double
    typealias Publisher = AnyPublisher<Percentage, Error>
    fileprivate typealias Subject = CurrentValueSubject<Percentage, Error>
    
    private lazy var urlSession = URLSession(
        configuration: .default,
        delegate: self,
        delegateQueue: .main
    )
    
    private var subjectsByTaskID = [Int: Subject]()
    fileprivate let subject = Subject(0)
    fileprivate var removeSubject: (()->Void)?
    
    func uploadFile(at fileURL: URL, to targetURL: URL) -> Publisher {
        
        var request = URLRequest(
            url: targetURL,
            cachePolicy: .reloadIgnoringLocalCacheData
        )
        
        request.setValue("text/plain",
                         forHTTPHeaderField: "Content-Type")
        request.setValue("keep-Alive", forHTTPHeaderField: "connection")
        request.httpMethod = "POST"
        let task = urlSession.uploadTask(with: request, fromFile: fileURL)
       
        subjectsByTaskID[task.taskIdentifier] = subject
        removeSubject = { [weak self] in
            self?.subjectsByTaskID.removeValue(forKey: task.taskIdentifier)
        }
        
        task.resume()
        return subject.eraseToAnyPublisher()
    }
}

extension FileUploader: URLSessionTaskDelegate {
    
    func urlSession(_ session: URLSession,
                    task: URLSessionTask,
                    didSendBodyData bytesSent: Int64,
                    totalBytesSent: Int64,
                    totalBytesExpectedToSend: Int64){
        let progress = Double(totalBytesSent) / Double(totalBytesExpectedToSend)
        let subject = subjectsByTaskID[task.taskIdentifier]
        subject?.send(progress * 100)
    }
    
    func urlSession(_ session: URLSession,
                    task: URLSessionTask,
                    didCompleteWithError error: Error?) {
        if let err = error {
            self.subject.send(completion: .failure(err))
            print(err.localizedDescription)
        }
        self.removeSubject?()
    }
}

extension FileUploader: URLSessionDelegate {
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        print(#line)
    }
    
    func urlSession(_ session: URLSession,
                    didBecomeInvalidWithError error: Error?) {
        if let err = error {
            self.subject.send(completion: .failure(err))
            print(err.localizedDescription)
        }
        self.removeSubject?()
    }
}

extension FileUploader: URLSessionDataDelegate {
    
    func urlSession(_ session: URLSession,
                    dataTask: URLSessionDataTask,
                    didReceive response: URLResponse,
                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        
        if (response as? HTTPURLResponse)?.statusCode == 200 {
            self.subject.send(completion: .finished)
        }
        completionHandler(URLSession.ResponseDisposition.allow)
    }
    
    func urlSession(_ session: URLSession,
                    dataTask: URLSessionDataTask,
                    didReceive data: Data) {
        self.removeSubject?()
        print(String(decoding: data, as: UTF8.self))
    }
}
