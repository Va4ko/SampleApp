//
//  ODRManager.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 7.03.22.
//

import Foundation
import Zip
import UIKit

class ODRManager {
    static let shared = ODRManager()
    
    var currentRequest: NSBundleResourceRequest?
    
    func requestBundle(tag: String, progressView: UIProgressView?, onSuccess: @escaping () -> Void, onFailure: @escaping (NSError) -> Void) {
        currentRequest = NSBundleResourceRequest(tags: [tag])
        
        guard let request = currentRequest else { return }
        
        request.conditionallyBeginAccessingResources { bundleAvailable in
            if bundleAvailable {
                if let progressView = progressView {
                    self.extractGame(tag: tag, progressView: progressView, fileExtension: "zip", onSuccess: {
                        onSuccess()
                    })
                } else {
                    self.extractGame(tag: tag, progressView: nil, fileExtension: "zip") {
                        onSuccess()
                    }
                }
            } else {
                request.beginAccessingResources { (error: Error?) in
                    if let error = error {
                        onFailure(error as NSError)
                        return
                    }
                    if let progressView = progressView {
                        self.extractGame(tag: tag, progressView: progressView, fileExtension: "zip", onSuccess: {
                            onSuccess()
                        })
                    }
                    else {
                        self.extractGame(tag: tag, progressView: nil, fileExtension: "zip") {
                            onSuccess()
                        }
                    }
                }
            }
        }
    }
    
    func extractGame(tag: String, progressView: UIProgressView?, fileExtension: String, onSuccess: @escaping () -> Void) {
        guard let fileName = Bundle.main.url(forResource: tag, withExtension: fileExtension) else { return }
        guard let destination = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let tagDirectory = destination.path + "/\(tag)"
        do {
            try FileManager.default.createDirectory(at: URL(fileURLWithPath: tagDirectory), withIntermediateDirectories: true)
            let startUnzippingDate = Date()
//            _ = try Zip.quickUnzipFile(fileName, progress: { (progress) -> () in
//                DispatchQueue.main.async {
//                    progressView?.progress = Float(progress)
//                }
//                let zipProgress = (progress * 100)
//                print("Finished - \(String(format: "%.1f", zipProgress))%")
//
//            })
            
            _ = try Zip.unzipFile(fileName, destination: URL(fileURLWithPath: tagDirectory), overwrite: true, password: nil, progress: {
                (progress) -> () in
                    DispatchQueue.main.async {
                        progressView?.progress = Float(progress)
                    }
                    let zipProgress = (progress * 100)
                    print("Finished - \(String(format: "%.1f", zipProgress))%")
            }, fileOutputHandler: nil)
            
            print("FINISHED: Total time - \(Date().timeIntervalSince(startUnzippingDate).rounded()) seconds")
            print(fileName)
            print("DESTINATION: \(URL(fileURLWithPath: tagDirectory))")
            onSuccess()
        } catch {
            print("Error unzipping!")
        }
        
    }
    
    func delete(tag: String) {
        let folderForDelete = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path + "/\(tag)"
        print(folderForDelete)
        do {
            let items = try FileManager.default.contentsOfDirectory(atPath: FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            
            for item in items {
                print("Found \(item)")
            }
            try FileManager.default.removeItem(at: URL(fileURLWithPath: folderForDelete))
        } catch  { print(error.localizedDescription) }
    }
    
}
