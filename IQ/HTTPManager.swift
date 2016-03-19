//
//  HTTPManager.swift
//  IQ
//
//  Created by Sunny on 12/26/15.
//  Copyright © 2015 Sunny. All rights reserved.
//

import Foundation

typealias ResultBlock      = (() -> Void)?
typealias SuccessFileBlock = ((NSURL) -> Void)?
typealias SuccessJSONBlock = ((NSDictionary) -> Void)?
typealias FailureBlock     = ((NSError) -> Void)?

class HTTPManager: NSObject {
    static let sharedInstance = HTTPManager()
    
    private let session = NSURLSession.sharedSession()
    
    func request(URLString URLString: String,
                             success: SuccessJSONBlock,
                             failure: ResultBlock) {
        let URL = NSURL(string: URLString)!
        session.dataTaskWithURL(URL) { data, response, error in
            if let data = data {
                do {
                    let JSON = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                    if let JSON = JSON as? NSDictionary {
                        if let success = success {
                            success(JSON)
                        }
                    } else {
                        print("data cannot be transfered into JSON")
                    }
                } catch let JSONError as NSError {
                    print ("JSONError: \(JSONError.localizedDescription)")
                }
            } else {
                if let failure = failure, error = error {
                    print ("error: \(error.localizedDescription)")
                    failure()
                }
            }
        }.resume()
            
    }
    
    func download(URLString URLString: String,
                              success: SuccessFileBlock,
                              failure: ResultBlock) {
        let URL = NSURL(string: URLString)!
        session.downloadTaskWithURL(URL) { localfile, response, error in
            
            if let localfile = localfile, response = response {
                let directoryURL = NSFileManager.defaultManager().URLsForDirectory(.CachesDirectory, inDomains: .UserDomainMask)[0]
                let pathComponent = response.suggestedFilename
                let destinationURL = directoryURL.URLByAppendingPathComponent(pathComponent!)
                let isWriten = NSData(contentsOfURL: localfile)!.writeToURL(destinationURL, atomically: true)
                if let success = success where isWriten {
                    success(destinationURL)
                } else {
                    print("isWriten--\(isWriten)")
                }
            } else {
                if let failure = failure, error = error {
                    print ("error: \(error.localizedDescription)")
                    failure()
                }
            }
        }.resume()
    }
}
