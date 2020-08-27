//
//  SafariOptions.swift
//  CSafariWebKit-Example
//
//  Created by Douglas Mandarino on 25/08/20.
//  Copyright © 2020 Douglas Mandarino. All rights reserved.
//

import UIKit
import CSafariWebKit

final class SafariRouter: RouterProtocol {
    
    var components: [ItemMenu] = []
    var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func getComponents() -> [ItemMenu] {
        self.components.append(ItemMenu(name: "Load", action: loadURL))
        self.components.append(ItemMenu(name: "Present Default", action: showDefault))
        self.components.append(ItemMenu(name: "When Did Close", action: presentDidClose))
        self.components.append(ItemMenu(name: "Close Button", action: presentCloseButton))
        self.components.append(ItemMenu(name: "Cancel Button", action: presentCancelButton))
        self.components.append(ItemMenu(name: "Custom Bar Colors", action: presentBarTintColor))
        self.components.append(ItemMenu(name: "Modally", action: presentModally))
        self.components.append(ItemMenu(name: "Enter Reader", action: presentEnterReader))
        self.components.append(ItemMenu(name: "Bar Collapsing", action: presentBarCollapsing))
        
        return self.components
    }
    
    private func loadURL() {
        let safari = WebView.safari.load(url: url)
        viewController.present(safari, animated: true, completion: nil)
    }
    
    private func showDefault() {
        WebView.safari.present(url: url, from: viewController)
    }
    
    private func presentDidClose() {
        WebView.safari.present(url: url,
                               from: viewController,
                               whenDidClose: whenDidClose)
    }
    
    private func presentCloseButton() {
        WebView.safari.present(url: url,
                               from: viewController,
                               dismissButtonStyle: .close,
                               whenDidClose: nil)
    }
    
    private func presentCancelButton() {
        WebView.safari.present(url: url,
                               from: viewController,
                               dismissButtonStyle: .done,
                               whenDidClose: nil)
    }
    
    private func presentBarTintColor() {
        WebView.safari.present(url: url,
                               from: viewController,
                               dismissButtonStyle: .done,
                               barTintColor: .red,
                               tintColor: .black,
                               whenDidClose: nil)
    }
    
    private func presentModally() {
        WebView.safari.present(url: url,
                               from: viewController,
                               dismissButtonStyle: .done,
                               presentModally: true,
                               barCollapsingEnabled: true,
                               entersReaderIfAvailable: false,
                               barTintColor: nil,
                               tintColor: nil,
                               whenDidClose: nil)
    }
    
    private func presentEnterReader() {
        WebView.safari.present(url: url,
                               from: viewController,
                               dismissButtonStyle: .done,
                               presentModally: false,
                               barCollapsingEnabled: false,
                               entersReaderIfAvailable: true,
                               barTintColor: nil,
                               tintColor: nil,
                               whenDidClose: nil)
    }
    
    private func presentBarCollapsing() {
        WebView.safari.present(url: url,
                               from: viewController,
                               dismissButtonStyle: .done,
                               presentModally: false,
                               barCollapsingEnabled: true,
                               entersReaderIfAvailable: false,
                               barTintColor: nil,
                               tintColor: nil,
                               whenDidClose: nil)
    }
}
