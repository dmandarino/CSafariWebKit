//
//  WebViewController.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 13/08/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import Foundation
import WebKit


public class WebViewController: UIViewController {
    
    private var webView: WKWebView!
    private var didClose: (() -> ())?
    private var navController: UINavigationController!
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        webView = WKWebView()
        webView.navigationDelegate = self
    }
}

// MARK: - WebViewControllerProtocol

extension WebViewController: WebViewControllerProtocol {
    
    public func load(url: URL) -> UIViewController {
        loadWebView(url: url)
        return self
    }
    
    public func present(url: URL, from previousViewController: UIViewController) {
        presentWebView(url: url, from: previousViewController)
    }
    
    public func present(url: URL,
                        from previousViewController: UIViewController,
                        whenDidClose didClose: (() -> Void)?) {
        presentWebView(url: url, from: previousViewController, whenDidClose: didClose)
    }
    
    public func present(url: URL,
                        from previousViewController: UIViewController,
                        closeButtonName: String?,
                        buttonSide: ButtonSide,
                        barTintColor: UIColor?,
                        tintColor: UIColor?,
                        whenDidClose didClose: (() -> Void)?) {
        presentWebView(url: url,
                       from: previousViewController,
                       closeButtonName: closeButtonName,
                       buttonSide: buttonSide,
                       barTintColor: barTintColor,
                       tintColor: tintColor,
                       whenDidClose: didClose)
    }
    
    public func present(url: URL,
                        from previousViewController: UIViewController,
                        closeButtonName: String?,
                        buttonSide: ButtonSide,
                        barTintColor: UIColor?,
                        tintColor: UIColor?,
                        title: String?,
                        whenDidClose didClose: (() -> Void)?) {
        presentWebView(url: url,
                       from: previousViewController,
                       closeButtonName: closeButtonName,
                       buttonSide: buttonSide,
                       barTintColor: barTintColor,
                       tintColor: tintColor,
                       title: title,
                       whenDidClose: didClose)
    }
        
    public func present(url: URL,
                        from previousViewController: UIViewController,
                        closeButtonName: String?,
                        buttonSide: ButtonSide,
                        barTintColor: UIColor?,
                        tintColor: UIColor?,
                        title: String?,
                        userAgent: String,
                        whenDidClose didClose: (() -> Void)?) {
        presentWebView(url: url,
                       from: previousViewController,
                       closeButtonName: closeButtonName,
                       buttonSide: buttonSide,
                       barTintColor: barTintColor,
                       tintColor: tintColor,
                       title: title,
                       userAgent: userAgent,
                       whenDidClose: didClose)
    }
    
    private func presentWebView(url: URL,
                                from previousViewController: UIViewController,
                                closeButtonName: String? = nil,
                                buttonSide: ButtonSide = .left,
                                barTintColor: UIColor? = nil,
                                tintColor: UIColor? = nil,
                                title: String? = nil,
                                userAgent: String = "",
                                whenDidClose didClose: (() -> Void)? = nil) {
        loadWebView(url: url)
        self.didClose = didClose
        setCloseButton(closeButtonName: closeButtonName, buttonSide: buttonSide)
        setupNavigationController(from: previousViewController,
                                  closeButtonName: closeButtonName,
                                  barTintColor: barTintColor,
                                  tintColor: tintColor,
                                  title: title)
        webView.customUserAgent?.append(userAgent)
        presentViewController(from: previousViewController)
    }
    
    private func setupNavigationController(from previousViewController: UIViewController,
                                           closeButtonName: String?,
                                           barTintColor: UIColor?,
                                           tintColor: UIColor?,
                                           title: String?) {
        let navBar = previousViewController.navigationController?.navigationBar
        let colorKey = NSAttributedString.Key.foregroundColor
        let previousTintColor = navBar?.titleTextAttributes?[colorKey] as? UIColor
        
        navController = UINavigationController(rootViewController: self)
        navController.navigationBar.barTintColor = barTintColor ?? navBar?.barTintColor
        navController.navigationBar.tintColor = tintColor ?? previousTintColor
        navController.navigationBar.titleTextAttributes = [colorKey: tintColor ?? .black]
        navController.navigationBar.topItem?.title = title
    }
    
    private func createCloseButton(buttonName: String?) -> UIBarButtonItem {
        guard let title = buttonName, !title.isEmpty else {
            return UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeWebView))
        }
        return UIBarButtonItem(title: title, style: .done, target: self, action: #selector(closeWebView))
    }
    
    private func presentViewController(from previousViewController: UIViewController) {
        guard let navigationController = previousViewController.navigationController else {
            previousViewController.present(self, animated: true, completion: nil)
            return
        }
        navigationController.present(navController, animated: true, completion: nil)
    }
    
    private func setCloseButton(closeButtonName: String?, buttonSide: ButtonSide) {
        switch buttonSide {
        case .right:
            navigationItem.rightBarButtonItem = createCloseButton(buttonName: closeButtonName)
        default:
            navigationItem.leftBarButtonItem = createCloseButton(buttonName: closeButtonName)
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

// MARK: - WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
    
    public func webView(_ webView: WKWebView,
                        didFailProvisionalNavigation navigation: WKNavigation!,
                        withError error: Error) {
        print(error.localizedDescription)
    }
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start loading")
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish loading")
    }
}
