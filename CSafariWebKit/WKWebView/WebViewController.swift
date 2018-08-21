//
//  WebViewController.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 13/08/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import Foundation
import WebKit


class WebViewController: UIViewController {
    
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

extension WebViewController: WebViewControllerProtocol {
    
    func load(url: URL) -> UIView {
        loadWebView(url: url)
        return self.view
    }
    
    func present(url: URL, from previousViewController: UIViewController) {
        present(url: url, from: previousViewController, closeButtonName: nil, buttonSide: .left,
                barTintColor: nil, tintColor: nil, title: nil, userAgent: "", didClose: nil)
    }
    
    func present(url: URL, from previousViewController: UIViewController, whenDidClose didClose: (() -> Void)?) {
        present(url: url, from: previousViewController, closeButtonName: nil, buttonSide: .left,
                barTintColor: nil, tintColor: nil, title: nil, userAgent: "", didClose: didClose)
    }
    
    func present(url: URL, from previousViewController: UIViewController, closeButtonName: String?, buttonSide: ButtonSide,
                 barTintColor: UIColor?, tintColor: UIColor?, whenDidClose didClose: (() -> Void)?) {
        present(url: url, from: previousViewController, closeButtonName: closeButtonName, buttonSide: buttonSide,
                barTintColor: barTintColor, tintColor: tintColor, title: nil, userAgent: "", didClose: didClose)
    }
    
    func present(url: URL, from previousViewController: UIViewController, closeButtonName: String?, buttonSide: ButtonSide,
                 barTintColor: UIColor?, tintColor: UIColor?, title: String?, whenDidClose didClose: (() -> Void)?) {
        present(url: url, from: previousViewController, closeButtonName: closeButtonName, buttonSide: buttonSide,
                barTintColor: barTintColor, tintColor: tintColor, title: title, userAgent: "", didClose: didClose)
    }
    
    func present(url: URL, from previousViewController: UIViewController, closeButtonName: String?, buttonSide: ButtonSide,
                 barTintColor: UIColor?, tintColor: UIColor?, title: String?, userAgent: String, didClose: (() -> Void)?) {
        presentWebView(url: url, from: previousViewController, closeButtonName: closeButtonName,
                       barTintColor: barTintColor, tintColor: tintColor, title: title, userAgent: "", didClose: didClose)
        setCloseButton(closeButtonName: closeButtonName, buttonSide: buttonSide)
    }
    
    private func presentWebView(url: URL, from previousViewController: UIViewController, closeButtonName: String?,
                                barTintColor: UIColor?, tintColor: UIColor?, title: String?, userAgent: String, didClose: (() -> Void)?) {
        loadWebView(url: url)
        self.didClose = didClose
        setupNavigationController(from: previousViewController, closeButtonName: closeButtonName, barTintColor: barTintColor, tintColor: tintColor, title: title)
        webView.customUserAgent?.append(userAgent)
        presentViewController(from: previousViewController)
    }
    
    private func setupNavigationController(from previousViewController: UIViewController, closeButtonName: String?,
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
    
    private func setCloseButton(closeButtonName: String?, buttonSide: ButtonSide) {
        switch buttonSide {
        case .right:
            navigationItem.rightBarButtonItem = createCloseButton(buttonName: closeButtonName)
        default:
            navigationItem.leftBarButtonItem = createCloseButton(buttonName: closeButtonName)
        }
    }
    
    @objc private func closeWebView() {
        self.dismiss(animated: true, completion: didClose)
    }
}

extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start loading")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish loading")
    }
    
    private func loadWebView(url: URL) {
        webView.load(URLRequest(url: url))
        self.view = webView
    }
}
