//
//  WebView.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 10/11/19.
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

public class WebView: WebViewProtocol {}
