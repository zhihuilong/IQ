//
//  AboutController.swift
//  IQ
//
//  Created by Sunny on 3/21/16.
//  Copyright © 2016 Sunny. All rights reserved.
//

import UIKit

class AboutController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(NSURLRequest(URL: NSURL(string: IQURLAbout)!))
    }
    
}

extension AboutController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        spinner.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        spinner.removeFromSuperview()
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        spinner.removeFromSuperview()
    }
    
}
