//
//  WKWebViewRouter.swift
//  CSafariWebKit-Example
//
//  Created by Douglas Mandarino on 28/06/20.
//  Copyright © 2020 Douglas Mandarino. All rights reserved.
//

import UIKit
import CSafariWebKit

class WKWebViewRouter: RouterProtocol {

    var components: [ItemMenu] = []
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func getComponents() -> [ItemMenu] {
        self.components.append(ItemMenu(name: "Load URL", action: loadURL))
        self.components.append(ItemMenu(name: "Present Default", action: presentDefault))
        self.components.append(ItemMenu(name: "When Did Close", action: presentDidClose))
        self.components.append(ItemMenu(name: "Custom Button", action: presentCustomButton))
        self.components.append(ItemMenu(name: "Right Button", action: presentRightButton))
        self.components.append(ItemMenu(name: "Custom Color", action: presentCustomColor))
        self.components.append(ItemMenu(name: "Custom Title", action: presentCustomTitle))
    
        return self.components
    }
    
    private func config() {}
    
    private func loadURL() {
        let webview = WebView.wkWebView.load(url: url)
        self.viewController.present(webview, animated: true, completion: nil)
    }
    
    private func presentDefault() {
        WebView.wkWebView.present(url: url, from: viewController)
    }
    
    private func presentDidClose() {
        WebView.wkWebView.present(url: url,
                                  from: viewController,
                                  whenDidClose: whenDidClose)
    }
    
    private func presentCustomButton() {
        WebView.wkWebView.present(url: url,
                                  from: viewController,
                                  closeButtonName: "Close",
                                  buttonSide: .left,
                                  barTintColor: nil,
                                  tintColor: nil,
                                  whenDidClose: nil)
    }
    
    private func presentRightButton() {
        WebView.wkWebView.present(url: url,
                                  from: viewController,
                                  closeButtonName: "Close",
                                  buttonSide: .right,
                                  barTintColor: nil,
                                  tintColor: nil,
                                  whenDidClose: nil)
    }
    
    private func presentCustomColor() {
        WebView.wkWebView.present(url: url,
                                  from: viewController,
                                  closeButtonName: "Close",
                                  buttonSide: .left,
                                  barTintColor: .red,
                                  tintColor: .black,
                                  whenDidClose: nil)
    }
    
    private func presentCustomTitle() {
        WebView.wkWebView.present(url: url,
                                  from: viewController,
                                  closeButtonName: "Close",
                                  buttonSide: .left,
                                  barTintColor: nil,
                                  tintColor: nil,
                                  title: "GitHub",
                                  whenDidClose: nil)
    }
}
