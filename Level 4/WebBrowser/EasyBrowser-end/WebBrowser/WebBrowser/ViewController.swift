//
//  ViewController.swift
//  WebBrowser
//
//  Created by Baek on 2018. 6. 2..
//  Copyright © 2018년 appleofeyes. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func openPage(_ sender: UIButton) {
        
        if let url = URL(string: "https://developer.apple.com") {
            let request = URLRequest(url: url)        // url에 대한 URLRequest 인스턴스를 request에 할당한다.
            webView.load(request)
        }
    }
}

