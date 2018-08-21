//
//  WebView.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 13/08/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import Foundation

class WebView {
    
    public static var wkWebView: WebViewControllerProtocol {
        get {
            return WebViewController()
        }
    }
   
    public static var safari: SafariViewControllerProtocol {
        get {
            return SafariViewController()
        }
    }
}
