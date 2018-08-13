//
//  WebViewController.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 13/08/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import Foundation
import WebKit

public protocol WebViewControllerProcotol {
    func load(url: URL) -> UIView
    func presentClosingOnLeft(url: URL, from previousViewController: UIViewController)
    func presentClosingOnLeft(url: URL, from previousViewController: UIViewController, didClose: (() -> Void)?)
    func presentClosingOnLeft(url: URL, from previousViewController: UIViewController, closeButton: String?, barTintColor: UIColor?, tintColor: UIColor?, title: String?, didClose: (() -> Void)?)
    func presentClosingOnLeft(url: URL, from previousViewController: UIViewController, closeButton: String?, barTintColor: UIColor?, tintColor: UIColor?, title: String?, userAgent: String, didClose: (() -> Void)?)
    func presentClosingOnRight(url: URL, from previousViewController: UIViewController)
    func presentClosingOnRight(url: URL, from previousViewController: UIViewController, didClose: (() -> Void)?)
    func presentClosingOnRight(url: URL, from previousViewController: UIViewController, closeButton: String?, barTintColor: UIColor?, tintColor: UIColor?, title: String?, didClose: (() -> Void)?)
    func presentClosingOnRight(url: URL, from previousViewController: UIViewController, closeButton: String?, barTintColor: UIColor?, tintColor: UIColor?, title: String?, userAgent: String, didClose: (() -> Void)?)
}

public class WebViewController: UIViewController {
    
    private var webView: WKWebView!
    private var didClose: (() -> ())?
    private var navController: UINavigationController!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        webView = WKWebView()
        webView.navigationDelegate = self
    }
}

extension WebViewController: WebViewControllerProcotol {
    
    public func load(url: URL) -> UIView {
        loadWebView(url: url)
        return self.view
    }
    
    public func presentClosingOnLeft(url: URL, from previousViewController: UIViewController) {
        presentClosingOnLeft(url: url, from: previousViewController, closeButton: nil, barTintColor: nil, tintColor: nil, title: nil, userAgent: "", didClose: nil)
    }
    
    public func presentClosingOnLeft(url: URL, from previousViewController: UIViewController, didClose: (() -> Void)?) {
        presentClosingOnLeft(url: url, from: previousViewController, closeButton: nil, barTintColor: nil, tintColor: nil, title: nil, userAgent: "", didClose: didClose)
    }
    
    public func presentClosingOnLeft(url: URL, from previousViewController: UIViewController, closeButton: String?, barTintColor: UIColor?, tintColor: UIColor?, title: String?, didClose: (() -> Void)?) {
        presentClosingOnLeft(url: url, from: previousViewController, closeButton: closeButton, barTintColor: barTintColor, tintColor: tintColor, title: title, userAgent: "", didClose: didClose)
    }
    
    public func presentClosingOnLeft(url: URL, from previousViewController: UIViewController, closeButton: String?, barTintColor: UIColor?, tintColor: UIColor?, title: String?, userAgent: String, didClose: (() -> Void)?) {
        presentWebView(url: url, from: previousViewController, closeButton: closeButton,
                       barTintColor: barTintColor, tintColor: tintColor, title: title, userAgent: "", didClose: didClose)
        navigationItem.leftBarButtonItem = createCloseButton(buttonName: closeButton)
    }
    
    public func presentClosingOnRight(url: URL, from previousViewController: UIViewController) {
        presentClosingOnRight(url: url, from: previousViewController, closeButton: nil, barTintColor: nil, tintColor: nil, title: nil, userAgent: "", didClose: nil)
    }
    
    public func presentClosingOnRight(url: URL, from previousViewController: UIViewController, didClose: (() -> Void)?) {
        presentClosingOnRight(url: url, from: previousViewController, closeButton: nil, barTintColor: nil, tintColor: nil, title: nil, userAgent: "", didClose: didClose)
    }
    
    public func presentClosingOnRight(url: URL, from previousViewController: UIViewController, closeButton: String?, barTintColor: UIColor?, tintColor: UIColor?, title: String?, didClose: (() -> Void)?) {
        presentClosingOnRight(url: url, from: previousViewController, closeButton: closeButton, barTintColor: barTintColor, tintColor: tintColor, title: title, userAgent: "", didClose: didClose)
    }
    
    public func presentClosingOnRight(url: URL, from previousViewController: UIViewController, closeButton: String?, barTintColor: UIColor?, tintColor: UIColor?, title: String?, userAgent: String, didClose: (() -> Void)?) {
        presentWebView(url: url, from: previousViewController, closeButton: closeButton,
                       barTintColor: barTintColor, tintColor: tintColor, title: title, userAgent: "", didClose: didClose)
        navigationItem.rightBarButtonItem = createCloseButton(buttonName: closeButton)
    }
    
    private func presentWebView(url: URL, from previousViewController: UIViewController, closeButton: String?,
                                barTintColor: UIColor?, tintColor: UIColor?, title: String?, userAgent: String, didClose: (() -> Void)?) {
        loadWebView(url: url)
        self.didClose = didClose
        setupNavigationController(from: previousViewController, closeButton: closeButton, barTintColor: barTintColor, tintColor: tintColor, title: title)
        webView.customUserAgent?.append(userAgent)
        presentViewController(from: previousViewController)
    }
    
    private func setupNavigationController(from previousViewController: UIViewController, closeButton: String?,
                                           barTintColor: UIColor?, tintColor: UIColor?, title: String?) {
        navController = UINavigationController(rootViewController: self)
        navController.navigationBar.barTintColor = barTintColor ?? previousViewController.navigationController?.navigationBar.barTintColor
        navController.navigationBar.tintColor = tintColor ?? previousViewController.navigationController?.navigationBar.tintColor
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor ?? .black]
        navController.navigationBar.topItem?.title = title
    }
    
    private func createCloseButton(buttonName: String?) -> UIBarButtonItem {
        if let title = buttonName, !title.isEmpty {
            return UIBarButtonItem(title: title, style: .done, target: self, action: #selector(closeWebView))
        }
        return UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeWebView))
    }
    
    private func presentViewController(from previousViewController: UIViewController) {
        if previousViewController.navigationController != nil {
            previousViewController.navigationController?.present(navController, animated: true, completion: nil)
        } else {
            previousViewController.present(self, animated: true, completion: nil)
        }
    }
    
    private func loadWebView(url: URL) {
        webView.load(URLRequest(url: url))
        self.view = webView
    }
    
    @objc private func closeWebView() {
        self.dismiss(animated: true, completion: didClose)
    }
}

extension WebViewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start loading")
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish loading")
    }
}
