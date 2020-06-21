//
//  WebViewProtocol.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 21/08/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import Foundation

public protocol WebViewProtocol {
    static var wkWebView: WebViewControllerProtocol { get }
    static var safari: SafariViewControllerProtocol { get }
}

extension WebViewProtocol {
    public static var wkWebView: WebViewControllerProtocol {
        get {
            return WebViewController()
        }
    }
    public static var safari: SafariViewControllerProtocol  {
        get {
            return SafariViewController()
        }
    }
}
